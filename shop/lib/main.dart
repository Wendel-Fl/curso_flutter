import 'package:flutter/material.dart';

import 'utils/app_routes.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurpleAccent,
          secondary: Colors.deepOrange,
        ),
        fontFamily: 'Lato',
      ),
      routes: {
        AppRoutes.productDetail: (ctx) => const ProductDetailScreen(),
      },
      home: ProductOverviewScreen(title: 'Minha Loja'),
      debugShowCheckedModeBanner: false,
    );
  }
}
