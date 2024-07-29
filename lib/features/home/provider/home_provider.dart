import 'package:e_store_pr/features/home/data/models/product.dart';
import 'package:e_store_pr/features/home/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final ProductRepository productRepository;

  HomeProvider({required this.productRepository});

  List<Product> _products = [];
  List<Product> get prodcust => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  Future<void> getHomeList() async {
    try {
      _isLoading = true;
      _products = await productRepository.getProducts();
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
