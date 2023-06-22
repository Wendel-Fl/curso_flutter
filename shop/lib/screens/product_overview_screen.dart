import 'package:flutter/material.dart';

import '../models/product.dart';
import '../data/dummy_data.dart';
import '../components/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  final String title;
  final List<Product> loadedProducts = dummyProducts;

  ProductOverviewScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: dummyProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, index) => ProductItem(
          product: loadedProducts[index],
        ),
      ),
    );
  }
}
