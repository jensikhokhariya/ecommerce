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
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    ),
  );
}
