import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  String get title;
  String get imageName;
  @nullable
  double get cost;

  Product._();

  factory Product([updates(ProductBuilder b)]) = _$Product;
  static Serializer<Product> get serializer => _$productSerializer;
}
