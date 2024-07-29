import 'dart:convert';

import '../../../../core/network/api_client.dart';
import '../models/product.dart';

class ProductRepository {
  final ApiClient apiClient;

  ProductRepository({required this.apiClient});

  Future<List<Product>> getProducts() async {
    final response = await apiClient.get('/products');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
