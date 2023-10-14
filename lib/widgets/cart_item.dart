import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final int quantity;
  final double price;
  final String title;

  CartItem(
      {required this.id,
      required this.productId,
      required this.quantity,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
          color: Theme.of(context).colorScheme.error,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) => Provider.of<Cart>(context,listen: false).removeItem(productId,listen: false),
      child: Card(
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
          )),
    );
  }
}
