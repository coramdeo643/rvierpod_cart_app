import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_flutter/provieders/cart_provider.dart';
import 'package:work_flutter/provieders/product_provider.dart';
import 'package:work_flutter/widgets/product_card.dart';

import 'cart_screen.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.read(productListProvider);
    final cartItemCount = ref.watch(cartItemCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart),
                iconSize: 24,
              ),
              Positioned(
                right: 8,
                top: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "$cartItemCount",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productList[index]);
          },
        ),
      ),
    );
  }
}
