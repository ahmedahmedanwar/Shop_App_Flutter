import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
// ignore: unused_import
import '../widgets/badge.dart';
import '../providers/cart.dart';
// import './cart_screen.dart';

import 'package:badges/badges.dart' as badges;

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 7),
            child: PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    ),
                  ],
          
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12,top: 7),
            child: Consumer<Cart>(
              builder: (_, cart, ch) => badges.Badge (
                position: badges.BadgePosition.topEnd(top: -10, end: -7),
                    child: ch,
                    badgeContent:  Text(cart.itemCount.toString()),
                    badgeStyle: badges.BadgeStyle(shape: badges.BadgeShape.circle),
                    stackFit: StackFit.passthrough,
                    // badgeAnimation: badges.BadgeAnimation.slide(toAnimate: true),
                  ),
              child: IconButton(
                iconSize: 25.0,
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
