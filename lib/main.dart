import 'package:flutter/material.dart';
import 'package:flutter_application_2/Weather1.dart';
import 'package:flutter_application_2/Search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        "/": (context) => Weatherhome(),
        "Search": (context) => const Search(),
      },
    );
  }
}
