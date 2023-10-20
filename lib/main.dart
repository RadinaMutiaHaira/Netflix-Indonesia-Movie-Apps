import 'package:flutter/material.dart';
import 'package:rcinemaapps/Screens/category_screen.dart';
import 'package:rcinemaapps/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/category': (context) => CategoryScreen(),
      },
    );
  }
}
