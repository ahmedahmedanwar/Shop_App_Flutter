import 'dart:ffi';

import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int quantity;
  final double price;
  final String title;

  CartItem(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
            ),
            title: Text(title),
            subtitle: Text('Total:{\$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ));
  }
}
