import 'package:ecommerce/screen/home/homeScreen.dart';
import 'package:ecommerce/screen/home/homepage.dart';
import 'package:ecommerce/screen/home/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
          'page2':(context)=>Home_Screen(),
        },
      ),
    ),
  );
}
