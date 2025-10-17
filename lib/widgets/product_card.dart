// 상품 하나를 표시하는 재사용 가능한 카드 위젯
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_flutter/models/product.dart';

import '../provieders/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              product.imageUrl ?? '',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${product.price}"),
                      ElevatedButton(
                          onPressed: () {
                            // 창고 관리자에 접근해서 상품을 추가해 달라고 요청
                            ref.read(cartProvider.notifier).addProduct(product);
                          },
                          child: const Icon(Icons.add_shopping_cart))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
