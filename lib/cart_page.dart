import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_ecommerce_app/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: const Text(
                              "Are you sure you want to remove this product from your cart"),
                          title: const Text("Delete"),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "no",
                                style: TextStyle(
                                    color: Colors.grey[800], fontSize: 20),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                              onPressed: () {
                                Navigator.pop(context);
                                context
                                    .read<CartProvider>()
                                    .remove(cart[index]);
                              },
                              child: const Text(
                                "yes",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart[index]["title"] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("size: ${(cart[index]["size"])}")
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
