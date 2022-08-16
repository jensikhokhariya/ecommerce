import 'package:ecommerce/screen/api/apiclass.dart';
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
                child: FutureBuilder<Store>(
                  future: Apicall().getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.hasError}");
                    } else if (snapshot.hasData) {
                      Store s1 = snapshot.data;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.network("${s1.images![0]}"),
                                  ),
                                  Text("${s1.title![0]}"),
                                  Text("")
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }
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
