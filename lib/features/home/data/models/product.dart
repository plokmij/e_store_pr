// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.thumbnail,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      discountPercentage: (map['discountPercentage'] as num).toDouble(),
      thumbnail: map['thumbnail'] as String,
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  double get discountedPrice => price - (price * discountPercentage / 100);
}
