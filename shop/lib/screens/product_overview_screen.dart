import '../models/product.dart';
import '../data/dummy_data.dart';
import 'package:flutter/material.dart';

class ProductOverviewScreen extends StatelessWidget {
  final String title;
  final List<Product> loadedProducts = dummyProducts;

  ProductOverviewScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: dummyProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (ctx, index) => Text(loadedProducts[index].title),
        ),
      ),
    );
  }
}
