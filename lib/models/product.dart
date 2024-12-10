class Product {
  final int id;
  final String title;
  final String description;
  final String imgUrl;
  final int price;
  final int? oldPrice;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.imgUrl,
    required this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['ID'],
      title: json['Name'],
      description: json['Description'],
      price: (json['Price'] as num).toInt(),
      imgUrl: json['ImageURL'],
      oldPrice:
          json['OldPrice'] != null ? (json['OldPrice'] as num).toInt() : null,
      isFavorite: json['IsFavorite'] ?? false,
    );
  }
}
