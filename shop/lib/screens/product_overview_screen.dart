import 'package:flutter/material.dart';

import '../components/product_grid.dart';

enum FilterOption { favorite, all }

class ProductOverviewScreen extends StatefulWidget {
  final String title;

  const ProductOverviewScreen({required this.title, super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              setState(() {
              if (selected == FilterOption.favorite) {
                _showFavoriteOnly = true;
              } else {
                _showFavoriteOnly = false;
              }
              });
            },
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
