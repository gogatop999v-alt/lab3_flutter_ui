import 'package:flutter/material.dart';

import '../models/product.dart';
import '../theme.dart';
import 'product_detail_screen.dart';

/// Экран «Карточки»: 4 карточки товаров с кнопкой «Подробнее».
class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карточки')),
      body: ListView.builder(
        padding: const EdgeInsets.all(kPadding),
        itemCount: kProducts.length,
        itemBuilder: (context, index) {
          final product = kProducts[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            margin: const EdgeInsets.only(bottom: kPadding),
            shape: RoundedRectangleBorder(borderRadius: kCardRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: product.name,
                  child: ProductImage(url: product.imageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(kPadding, 12, kPadding, 0),
                  child: Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kPadding,
                    vertical: 8,
                  ),
                  child: Text(product.shortDescription),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: product),
                        ),
                      ),
                      child: const Text('Подробнее'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Изображение из сети с индикатором загрузки и запасным вариантом при ошибке.
class ProductImage extends StatelessWidget {
  final String url;

  const ProductImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) => Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          alignment: Alignment.center,
          child: const Icon(Icons.image_not_supported, size: 48),
        ),
      ),
    );
  }
}
