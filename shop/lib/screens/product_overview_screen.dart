import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_grid.dart';
import '../models/product_list.dart';

enum FilterOption { favorite, all }

class ProductOverviewScreen extends StatelessWidget {
  final String title;

  const ProductOverviewScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
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
            onSelected: (FilterOption selected) {
              if (selected == FilterOption.favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            }
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
