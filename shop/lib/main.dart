import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';

import 'models/cart.dart';
import 'models/order_list.dart';
import 'models/product_list.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_overview_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.deepPurpleAccent,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.home: (ctx) => const ProductOverviewScreen(),
          AppRoutes.productDetail: (ctx) => const ProductDetailScreen(),
          AppRoutes.cart: (ctx) => const CartScreen(),
          AppRoutes.orders: (ctx) => const OrdersScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
