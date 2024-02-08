import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';

class AddProductUseCase {
  final ProductRepository productRepository;

  AddProductUseCase(this.productRepository);

  Future<void> execute(Product product) async {
    await productRepository.addProduct(product);
  }
}