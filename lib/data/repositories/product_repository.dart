import '../models/product.dart';

abstract class ProductRepository {
  Future<void> addProduct(Product product);
  Future<List<Product>> getAllProducts();
}