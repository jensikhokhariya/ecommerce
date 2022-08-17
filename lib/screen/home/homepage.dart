import 'package:ecommerce/screen/api/storeapi.dart';
import 'package:ecommerce/screen/home/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   var providerf;
   var providert;
   @override
  Widget build(BuildContext context) {
    providerf = Provider.of<HomeProvider>(context,listen: false);
    providert = Provider.of<HomeProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
          actions: [
            Switch(value: Provider.of<HomeProvider>(context,listen: true).isTheme, onChanged: (value){
              Provider.of<HomeProvider>(context,listen: false).changeTheme(value);
            }),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          //color: Colors.grey.shade400,
          padding: EdgeInsets.all(5),
          child: Column(

            children: [
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: Apicall().getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<dynamic> s1 = snapshot.data;
                      return GridView.builder(
                          itemCount: s1.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'page2');
                              },
                              child: Container(
                                height: 200,
                                width: 200,
                                // color: Colors.white,
                                margin: EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 110,
                                      child: Image.network(
                                        "${s1[index].image}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("${s1[index].category},",),
                                        Spacer(),
                                        Container(
                                          height: 20,
                                          width: 45,
                                          child: Text(
                                              "  ${s1[index].rating.rate}"),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.green.shade800,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ps. ${s1[index].price}",
                                          style: TextStyle(fontSize: 20,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
