import 'package:flutter/material.dart';
import 'package:shoe_ecommerce_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shoes",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          primary: Colors.yellow,
          secondary: Colors.grey[300],
        ),
        appBarTheme: AppBarTheme(color: Colors.grey[300], toolbarHeight: 70),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
