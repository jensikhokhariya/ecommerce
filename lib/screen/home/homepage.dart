import 'package:ecommerce/screen/api/storeapi.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
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
                              onTap: (){
                                Navigator.pushNamed(context, 'page2');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.network("${s1[index].image}"),
                                  ),
                                  Row(
                                    children: [
                                      Text("${s1[index].category}"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height:22,
                                        width: 30,
                                        alignment: Alignment.center,
                                        child: Text("${s1[index].rating.rate},"),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("ps.${s1[index].price},"),
                                    ],
                                  ),
                                ],
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
