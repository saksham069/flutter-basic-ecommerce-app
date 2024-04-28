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
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
