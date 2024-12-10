import 'package:flutter/material.dart';
import 'package:flutter_app_8/pages/product_page.dart';
import '../components/product_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  var products = [];
  void toProductPage(BuildContext context, int index) {
    var id = products[index].id;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductPage(
          productId: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProducts =
        products.where((product) => product.isFavorite == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранные товары'),
      ),
      backgroundColor: Colors.white,
      body: favoriteProducts.isEmpty
          ? const Center(child: Text('Нет избранных товаров.'))
          : GridView.count(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              children: List.generate(favoriteProducts.length, (index) {
                return GestureDetector(
                  onTap: () => toProductPage(context, index),
                  child: ProductCard(product: favoriteProducts[index]),
                );
              }),
            ),
    );
  }
}
