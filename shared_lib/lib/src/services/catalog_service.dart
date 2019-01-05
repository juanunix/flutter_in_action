import 'package:shared_lib/e_commerce_app.dart';

abstract class CatalogService {
  Stream<List<Product>> streamProducts();

  Stream<List<Product>> streamProductCategory(ProductCategory category);

  Future<void> addNewProduct(Product product);

  Future<void> updateProduct(Product product);
}