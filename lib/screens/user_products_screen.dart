import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/main_drawer.dart';
import '../screens/edite_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_product_screen';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Products'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditeProductScreen.routeName);
            },
            icon: const Icon(Icons.add))
      ],),
      drawer: MainDrawer(),
      
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children:[ UserProductItem(
                title: productsData.items[i].title,
                imageUrl: productsData.items[i].imageUrl),
                Divider(),
          ],),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
