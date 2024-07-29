import 'package:e_store_pr/core/network/api_client.dart';
import 'package:e_store_pr/features/home/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(
        productRepository: ProductRepository(
          apiClient: ApiClient(baseUrl: 'https://dummyjson.com'),
        ),
      ),
      child: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getHomeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.hasError) {
            return const Center(
              child: Text('Failed to load products'),
            );
          } else {
            return ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(
                    product.price.toStringAsFixed(2),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
