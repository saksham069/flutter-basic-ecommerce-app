import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_ecommerce_app/cart_provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.product,
  });
  final Map<String, dynamic> product;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                widget.product["title"],
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const Spacer(),
            Image.asset(widget.product["imageUrl"]),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text("\$${widget.product["price"]}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                        itemCount: widget.product["sizes"].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Container(
                            width: 30,
                            color: (selected == index)
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                    widget.product["sizes"][index].toString())),
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        if (selected == null) {
                          // showSnackbar;
                          return;
                        }
                        Map<String, Object> prodMap = Map.from(widget.product);
                        prodMap.addAll(
                            {"size": widget.product["sizes"][selected]});
                        Provider.of<CartProvider>(context, listen: false)
                            .add(prodMap);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.grey[800],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
