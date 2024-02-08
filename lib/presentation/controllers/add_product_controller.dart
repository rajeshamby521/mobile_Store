import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../../domain/usecases/add_product_usecase.dart';

class AddProductController extends GetxController {
  final AddProductUseCase addProductUseCase;

  AddProductController(this.addProductUseCase);

  final RxString name = ''.obs;
  final RxDouble price = 0.0.obs;
  final RxString image = ''.obs;
  final RxString category = ''.obs;

  void setName(String value) => name.value = value;
  void setPrice(double value) => price.value = value;
  void setImage(String value) => image.value = value;
  void setCategory(String value) => category.value = value;

  Future<void> addProduct() async {
    final product = Product(
      name: name.value,
      price: price.value,
      image: image.value,
      category: category.value,
    );
    await addProductUseCase.execute(product);
    Get.back();
  }
}