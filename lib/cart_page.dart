import 'package:flutter/material.dart';
import 'package:shoe_ecommerce_app/global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Image.asset(cart[index]["imageUrl"] as String),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart[index]["title"] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("size: ${(cart[index]["sizes"] as List<int>)[0]}")
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  endIndent: 10,
                  indent: 10,
                ),
            itemCount: cart.length),
      ),
    );
  }
}
