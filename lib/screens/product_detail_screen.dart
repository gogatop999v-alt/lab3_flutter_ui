import 'package:flutter/material.dart';

import '../models/product.dart';
import '../theme.dart';
import '../toast_helper.dart';
import 'cards_screen.dart';

/// Экран с подробной информацией о выбранном товаре.
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: product.name, child: ProductImage(url: product.imageUrl)),
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    product.price,
                    style: textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: kPadding),
                  Text(product.fullDescription,
                      style: const TextStyle(fontSize: 16, height: 1.4)),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Добавить в корзину'),
                      onPressed: () =>
                          showToast('${product.name} добавлен в корзину'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
