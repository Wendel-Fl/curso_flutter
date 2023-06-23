import 'package:flutter/material.dart';

import '../components/product_grid.dart';

enum FilterOption { favorite, all }

class ProductOverviewScreen extends StatelessWidget {
  final String title;

  const ProductOverviewScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOption.favorite,
                child: Text('Somente favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOption.all,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOption selected) => print(selected),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
