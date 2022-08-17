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
      child: Consumer<HomeProvider>(
        builder: (context,provider,_){
          //provider.
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.isTheme?lightTheme:darkTheme,
            routes: {
              '/': (context) => HomePage(),
              'page2':(context)=>Home_Screen(),
            },
          );
        },
      ),
    ),
  );
}


ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.green.shade900),
  textTheme: TextTheme(headline1: TextStyle(color: Colors.black),),
  brightness: Brightness.light,
);
ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.green.shade600),
  textTheme: TextTheme(headline1: TextStyle(color: Colors.black),),
  brightness: Brightness.dark,
);

