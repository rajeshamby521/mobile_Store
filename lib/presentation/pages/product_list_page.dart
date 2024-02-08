import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/presentation/controllers/product_list_controller.dart';

class ProductListPage extends StatelessWidget {
  final ProductListController productListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: Obx(
            () => ListView.builder(
          itemCount: productListController.products.length,
          itemBuilder: (context, index) {
            final product = productListController.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('${product.price}'),
              onTap: () => null, // Add functionality to view product details
            );
          },
        ),
      ),
    );
  }
}
