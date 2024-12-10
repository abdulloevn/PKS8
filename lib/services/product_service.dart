import 'package:dio/dio.dart';
import '../api/instance.dart';
import '../models/product.dart';
import '../helpers/data_to_json.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    final response = await api.get('/products');
    return (response.data as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  static Future<Product> getProductById(int id) async {
    final Response response = await api.get('/products/$id');
    return Product.fromJson(response.data);
  }

  static Future<void> createProduct(Product product) async {
    await api.post('/products/create', data: productToJson(product));
  }

  static Future<void> updateProductById(int id, Product product) async {
    await api.put('/products/update/$id', data: productToJson(product));
  }

  static Future<void> deleteProduct(int id) async {
    await api.delete('/products/delete/$id');
  }
}
