import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  Product._();
  factory Product([updates(ProductBuilder b)]) = _$Product;
  static Serializer<Product> get serializer => _$ProductSerializer;
}

