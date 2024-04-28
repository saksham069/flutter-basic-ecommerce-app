import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.label,
    required this.price,
    required this.imgUrl,
    required this.company,
    required this.sizes,
  });

  final String label;
  final String price;
  final String imgUrl;
  final String company;
  final List<int> sizes;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: null,
      child: Listener(
        onPointerDown: (e) {
          setState(() {
            selected = true;
          });
        },
        onPointerUp: (e) {
          setState(() {
            selected = false;
          });
        },
        child: Card(
          surfaceTintColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: 2,
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$${widget.price}",
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(widget.imgUrl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
