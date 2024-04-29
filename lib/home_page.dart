import 'package:flutter/material.dart';
import 'package:shoe_ecommerce_app/cart_page.dart';
import 'package:shoe_ecommerce_app/products_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int navbarIndex;
  final List<Widget> pages = const [ProductsPage(), CartPage()];

  @override
  void initState() {
    super.initState();
    navbarIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navbarIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: navbarIndex,
        onTap: (value) {
          setState(() {
            navbarIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 35,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_rounded,
              size: 35,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
