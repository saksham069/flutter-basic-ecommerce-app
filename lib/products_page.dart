import 'package:flutter/material.dart';
import 'package:shoe_ecommerce_app/global_variables.dart';
import 'package:shoe_ecommerce_app/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<String> labels = ["All", "Adidas", "Nike", "Bata"];
  late int labelIndex;

  @override
  void initState() {
    super.initState();
    labelIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Shoes\nCollection",
                      style: Theme.of(context).textTheme.displayLarge,
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
                                    labelIndex = key;
                                  });
                                },
                                child: Chip(
                                    backgroundColor: (key == labelIndex)
                                        ? Theme.of(context).colorScheme.primary
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
                                  width: (key < labels.length - 1) ? 10 : 0),
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
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final p = (labelIndex == 0)
                      ? products[index]
                      : products
                          .where((element) =>
                              element["company"] == labels[labelIndex])
                          .elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ProductCard(
                      product: p,
                    ),
                  );
                },
                itemCount: (labelIndex == 0)
                    ? products.length
                    : products
                        .where((element) =>
                            element["company"] == labels[labelIndex])
                        .length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
