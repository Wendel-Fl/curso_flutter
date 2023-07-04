import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/order_widget.dart';

import '../components/app_drawer.dart';
import '../models/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Consumer<OrderList>(
              builder: (ctx, orders, child) => ListView.builder(
                itemCount: orders.itemsCount,
                itemBuilder: (ctx, index) =>
                    OrderWidget(order: orders.items[index]),
              ),
            );
          }
        },
        future: Provider.of<OrderList>(
          context,
          listen: false,
        ).loadedOrders(),
      ),
    );
  }
}
