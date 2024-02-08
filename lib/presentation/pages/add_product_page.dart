import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_store/presentation/controllers/add_product_controller.dart';

import '../../resource/strings_manager.dart';
import '../common_component/common_editext_view.dart';

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
            _productImage(),
            const SizedBox(height: 25),
            _productName(),

            const SizedBox(height: 16),
            _price(),

            // const SizedBox(height: 16),
            // TextFormField(
            //   onChanged: addProductController.setImage,
            //   decoration: const InputDecoration(labelText: 'Image URL'),
            // ),
            const SizedBox(height: 16),
            _category(),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => addProductController.addProduct(),
              child: addProductController.isLoading.value
                  ? const CircularProgressIndicator()
                  : Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productName() {
    return Obx(() => TextInputField(
          isPasswordField: false,
          errorText: addProductController.errorProductName.value,
          hintText: 'Product Name',
          textInputType: TextInputType.text,
          onChanged: (val) => addProductController.setName(val!),
        ));
  }

  Widget _price() {
    return Obx(() => TextInputField(
          errorText: addProductController.errorPrice.value,
          hintText: 'Price',
          textInputType: TextInputType.number,
          onChanged: (val) => addProductController.setPrice(double.parse(val!)),
        ));
  }

  Widget _category() {
    return Obx(() => TextInputField(
          errorText: addProductController.errorCategory.value,
          hintText: 'Category',
          textInputType: TextInputType.text,
          onChanged: (val) => addProductController.setCategory(val!),
        ));
  }

  Widget _productImage() {
    return Obx(() => GestureDetector(
          onTap: () async {
            _openImageSelection();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: addProductController.imageFile.value != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.file(
                      File(addProductController.imageFile.value!.path),
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(color: Colors.red[200]),
                    width: 150,
                    height: 150,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
          ),
        ));
  }

  void _openImageSelection() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                Get.back();
                addProductController.uploadImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                Get.back();
                addProductController.uploadImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
