import 'package:flutter/material.dart';
import 'package:shoe_ecommerce_app/details_page.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.company,
    required this.sizes,
  });

  final String title;
  final double price;
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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                title: widget.title,
                imgUrl: widget.imgUrl,
                price: widget.price,
                sizes: widget.sizes,
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
                    widget.title,
                    style: Theme.of(context).textTheme.displayMedium,
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
