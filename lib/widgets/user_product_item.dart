import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edite_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {

   
   var id;
  final String title;
  final String imageUrl;

  UserProductItem({required this.id,required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      trailing: Container(
        width: 120,
        child: Row(children: <Widget>[
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(EditeProductScreen.routeName, arguments: id);
          }, icon: Icon(Icons.edit),color: Theme.of(context).colorScheme.primary),
          IconButton(onPressed: () {
            Provider.of<Products>(context,listen: false).deleteProduct(id);
          }, icon: Icon(Icons.delete),color: Theme.of(context).colorScheme.error,),
        ]),
      ),
    );
  }
}
