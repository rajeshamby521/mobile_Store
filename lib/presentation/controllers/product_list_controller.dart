import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductListController extends GetxController {
  final GetProductsUseCase getProductsUseCase;

  ProductListController(this.getProductsUseCase);

  final RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    products.value = await getProductsUseCase.execute();
  }
}