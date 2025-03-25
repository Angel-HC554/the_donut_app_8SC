import 'package:donut_app_8sc/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donut App',
      theme: ThemeData(),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
