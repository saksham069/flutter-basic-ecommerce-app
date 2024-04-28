import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_ecommerce_app/global_variables.dart';
import 'package:shoe_ecommerce_app/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> labels = ["All", "Adidas", "Nike", "Bata"];
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Shoes\nCollection",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onTapOutside: (p) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search_rounded),
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.from(labels
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                              key,
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        index = key;
                                      });
                                    },
                                    child: Chip(
                                        backgroundColor: (key == index)
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(width: 0),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        label: Text(value)),
                                  ),
                                  SizedBox(
                                      width:
                                          (key < labels.length - 1) ? 10 : 0),
                                ],
                              ),
                            ),
                          )
                          .values
                          .toList()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final p = products[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ProductCard(
                        label: p["title"],
                        price: p["price"].toString(),
                        imgUrl: p["imageUrl"],
                        company: p["company"],
                        sizes: p["sizes"],
                      ),
                    );
                  },
                  itemCount: products.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
