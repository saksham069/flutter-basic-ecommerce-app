import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
                child: Row(
                  children: [
                    Expanded(
                      child: Placeholder(),
                    ),
                    Expanded(
                      child: Placeholder(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.from(labels
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              index = key;
                            });
                          },
                          child: Chip(
                              backgroundColor: (key == index)
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 0),
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              label: Text(value)),
                        ),
                      ),
                    )
                    .values
                    .toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
