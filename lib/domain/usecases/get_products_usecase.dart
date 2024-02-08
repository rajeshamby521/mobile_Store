

import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;

  GetProductsUseCase(this.productRepository);

  Future<List<Product>> execute() async {
    return await productRepository.getAllProducts();
  }
}
