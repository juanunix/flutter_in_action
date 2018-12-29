import 'package:built_collection/built_collection.dart';
import 'package:shared_lib/src/e_commerce_models.dart';
import 'package:shared_lib/src/models/catalog.dart';
import 'package:shared_lib/src/utils/product_map.dart';

/// Search through the [categorizeProducts] Map and find the category
/// who's value list contains this product.
/// Not efficient, but fine considering the small dataset.
ProductCategory getCategoryForProduct(String productName) =>
    categoizeProducts.entries
        .firstWhere((MapEntry<ProductCategory, List<String>> entry) =>
            entry.value.contains(productName))
        .key;

Product createProduct(String productName) {
  return new Product((b) => b
    ..title = productName
    ..imageTitle = availableProductsToImage[productName]
    ..category = getCategoryForProduct(productName)
    ..cost = 1.00);
}

Catalog populateCatalog() {
  ListBuilder<Product> catalog = ListBuilder();

  availableProductsToImage.forEach((String productName, ImageTitle imageTitle) {
    catalog.add(createProduct(productName));
  });

  return new Catalog((b) => b..availableProducts = catalog);
}
