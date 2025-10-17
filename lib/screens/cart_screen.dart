import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_flutter/provieders/cart_provider.dart';
import 'package:work_flutter/widgets/cart_item_title.dart';

import '../models/cart_item.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CartItem> cartItemList = ref.watch(cartProvider).items;
    final cartTotalPrice = ref.watch(cartTotalPriceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: cartItemList.isEmpty
          ? const Center(
              child: Text("Shopping cart is empty"),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: cartItemList.length,
              itemBuilder: (context, index) {
                return CartItemTitle(cartItem: cartItemList[index]);
              },
            ),
      bottomNavigationBar: cartItemList.isEmpty
          ? null
          : Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              padding: EdgeInsets.all(16),
              child: SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price: $cartTotalPrice",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Order"))
                ],
              )),
            ),
    );
  }
}
