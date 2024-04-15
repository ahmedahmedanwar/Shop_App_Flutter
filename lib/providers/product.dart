import 'package:flutter/foundation.dart';


class Product with ChangeNotifier {
  var id;
  var title;
  final String description;
  final double price;
  var imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
