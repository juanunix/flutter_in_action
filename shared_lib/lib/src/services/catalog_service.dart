import 'package:shared_lib/e_commerce_app.dart';

abstract class CatalogService {
  Stream<List> streamProducts();

  Future<void> addNewProduct(Product product);

  Future<void> updateProduct(Product product);
}