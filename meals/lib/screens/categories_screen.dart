import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import '../components/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos cozinhar?'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItem(cat);
        }).toList(),
      ),
    );
  }
}
