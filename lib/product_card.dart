import 'package:flutter/material.dart';
import 'package:shoe_ecommerce_app/details_page.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                product: widget.product,
              ),
            ));
      },
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
                    widget.product["title"],
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$${widget.product["price"]}",
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(widget.product["imageUrl"]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
