import 'package:flutter/material.dart';
import 'package:flutter_app_8/services/product_service.dart';
import '../models/product.dart';

class AddProductPage extends StatefulWidget {
  final Function(Product) onAddProduct;

  const AddProductPage({super.key, required this.onAddProduct});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddProductPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imgLinkController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    imgLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить товар'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Название товара'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Описание товара'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Цена товара'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imgLinkController,
              decoration: const InputDecoration(
                  labelText: 'Введите ссылку на изображение товара'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final newItem = Product(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: titleController.text,
                    description: descriptionController.text,
                    price: int.parse(priceController.text),
                    oldPrice: 0,
                    imgUrl: imgLinkController.text,
                    isFavorite: false,
                  );
                  try {
                    await ProductService.createProduct(newItem);
                    widget.onAddProduct(newItem);
                    Navigator.pop(context);
                  } catch (e) {
                    // ignore: avoid_print
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: const Color.fromRGBO(252, 133, 7, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(0, 48),
                ),
                child: const Text(
                  'Добавить в товары',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
