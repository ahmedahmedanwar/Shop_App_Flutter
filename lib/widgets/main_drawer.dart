
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';
import '../screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: MainDrawer(),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Lato', fontSize: 25, fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        
        children: [
          AppBar(   title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,),
          
          buildListTile(
              'Shop',
              Icons.shop,
                  () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
        Divider(),
          buildListTile(
              'Orders',
              Icons.payment,
                  () {
                Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
              }),
              Divider(),
          buildListTile(
              'Manage Products',
              Icons.edit,
                  () {
                Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
              }),
        ],
        
      ),
    );
  }
}

