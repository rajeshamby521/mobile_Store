import 'package:get/get.dart';
import 'package:mobile_store/domain/usecases/logout_usecase.dart';
import '../../data/models/product.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductListController extends GetxController {
  final GetProductsUseCase getProductsUseCase;
  final LogoutUseCase logoutUseCase;

  ProductListController(this.getProductsUseCase, this.logoutUseCase);

  final RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    products.value = await getProductsUseCase.execute();
  }


 void logoutUser() async {
   await logoutUseCase.execute();
   Get.back();
  }
}