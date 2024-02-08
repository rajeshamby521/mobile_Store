import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/product.dart';
import '../../domain/usecases/add_product_usecase.dart';

class AddProductController extends GetxController {
  final AddProductUseCase addProductUseCase;

  AddProductController(this.addProductUseCase);

  final RxBool isLoading = false.obs;
  ImagePicker imagePicker =  ImagePicker();

  final RxString name = ''.obs;
  final RxDouble price = 0.0.obs;
  final RxString category = ''.obs;
  final imageFile = Rx<XFile?>(null);

  void setName(String value) => name.value = value;

  void setPrice(double value) => price.value = value;


  void setCategory(String value) => category.value = value;

  RxString errorProductName = ''.obs;
  RxString errorPrice = ''.obs;
  RxString errorCategory = ''.obs;

  void setErrorProductName(String value) => errorProductName.value = value;

  void setErrorPrice(String value) => errorPrice.value = value;

  void setErrorCategory(String value) => errorCategory.value = value;

  Future<void> addProduct() async {
    if (name.value.isEmpty) {
      setErrorProductName('Enter product name');
    } else if (price.value == 0.0) {
      setErrorProductName('');
      setErrorPrice('Enter product price');
    } else if (category.value.isEmpty) {
      setErrorProductName('');
      setErrorPrice('');
      setErrorCategory('Enter product category');
    } else {
      setErrorProductName('');
      setErrorPrice('');
      setErrorCategory('');
      isLoading.value = true;
      final product = Product(
        name: name.value,
        price: price.value,
        image: imageFile.value!.path,
        category: category.value,
      );
      await addProductUseCase.execute(product);
      Get.back();
      isLoading.value = false;
    }
  }

  Future<void> uploadImage(imageSelectionType) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSelectionType);
    if (pickedImage != null) {
      imageFile.value = XFile(pickedImage.path);
    }
  }
}
