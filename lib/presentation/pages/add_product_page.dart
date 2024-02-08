import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/presentation/controllers/add_product_controller.dart';

class AddProductPage extends StatelessWidget {
  final AddProductController addProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: addProductController.setName,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: (value) => addProductController.setPrice(double.parse(value)),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: addProductController.setImage,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: addProductController.setCategory,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => addProductController.addProduct(),
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
