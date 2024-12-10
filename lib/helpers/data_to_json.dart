import 'package:flutter_app_8/models/product.dart';

Map<String, dynamic> productToJson(Product product) {
  return {
    'ID': product.id,
    'Name': product.title,
    'Description': product.description,
    'Price': product.price,
    'OldPrice': product.oldPrice,
    'ImageURL': product.imgUrl,
    'IsFavorite': product.isFavorite,
  };
}
