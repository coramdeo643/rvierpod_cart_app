import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_flutter/models/cart_item.dart';

import '../provieders/cart_provider.dart';

class CartItemTitle extends ConsumerWidget {
  final CartItem cartItem;
  const CartItemTitle({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image.network(cartItem.product.imageUrl ?? ''),
            ),
            SizedBox(width: 12),
            Expanded(child: Text("${cartItem.product.price}")),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).updateQuantity(
                            cartItem.product.id,
                            cartItem.quantity - 1,
                          );
                    },
                    icon: Icon(Icons.remove)),
                Text('${cartItem.quantity}'),
                IconButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).updateQuantity(
                            cartItem.product.id,
                            cartItem.quantity + 1,
                          );
                    },
                    icon: Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
