import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart' show Cart;
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                  label: Text('\$${cart.totalAmount}',
                      style: TextStyle(
                          color: Theme.of(context).primaryColorLight)),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Check Out'),
                )
                // style: ElevatedButton.styleFrom(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (ctx, i) => CartItem(
              id: cart.items.values.toList()[i].id,
              productId: cart.items.keys.toList()[i], 
              quantity: cart.items.values.toList()[i].quantity,
              price: cart.items.values.toList()[i].price,
              title: cart.items.values.toList()[i].title),
          itemCount: cart.items.length,
        ))
      ]),
    );
  }
}
