import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_store/presentation/controllers/product_list_controller.dart';

class ProductListPage extends StatelessWidget {
  final ProductListController productListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List'), actions: [
        GestureDetector(
          onTap: (){
            showAlertDialog();
          },
            child: const Icon(Icons.logout)),
        const SizedBox(
          width: 10,
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add_product')!
              .then((value) => productListController.fetchProducts());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Obx(
          () => ListView.separated(
            itemCount: productListController.products.length,
            itemBuilder: (context, index) {
              final product = productListController.products[index];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.black, // Set border color
                        width: 1.0), // Set border width
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)), // Set rounded corner radius
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black38,
                          offset: Offset(1, 3))
                    ] // Make rounded corner of border
                    ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: [
                    productListController.products[index].image.isNotEmpty
                        ? ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                            child: Image.file(
                              File(productListController.products[index].image),
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.fill,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.red[200]),
                              width: 50,
                              height: 50,
                            ),
                          ),
                    Expanded(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text('Name: ${product.name}'),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Price: ${product.price}'),
                                Text('Category: ${product.category}'),
                              ],
                            ),
                          ],
                        ),
                        onTap: () =>
                            null, // Add functionality to view product details
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        ),
      ),
    );
  }

  void showAlertDialog() {
    Get.defaultDialog(
      title: "Alert",
      middleText: "Are you sure want to logout...",
      textConfirm: "No",
      textCancel: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // Close the dialog
      },
      onCancel: () {
        // Handle OK button action
        Get.back(); // Close the dialog
      },
    );
  }
}
