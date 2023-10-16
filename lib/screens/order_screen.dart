import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(order: ordersData.orders[i],),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
