// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$ProductSerializer implements StructuredSerializer<Product> {
  @override
  final Iterable<Type> types = const [Product, _$Product];
  @override
  final String wireName = 'Product';

  @override
  Iterable serialize(Serializers serializers, Product object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'imageName',
      serializers.serialize(object.imageName,
          specifiedType: const FullType(String)),
    ];
    if (object.cost != null) {
      result
        ..add('cost')
        ..add(serializers.serialize(object.cost,
            specifiedType: const FullType(double)));
    }

    return result;
  }

  @override
  Product deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageName':
          result.imageName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cost':
          result.cost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Product extends Product {
  @override
  final String title;
  @override
  final String imageName;
  @override
  final double cost;

  factory _$Product([void updates(ProductBuilder b)]) =>
      (new ProductBuilder()..update(updates)).build();

  _$Product._({this.title, this.imageName, this.cost}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Product', 'title');
    }
    if (imageName == null) {
      throw new BuiltValueNullFieldError('Product', 'imageName');
    }
  }

  @override
  Product rebuild(void updates(ProductBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductBuilder toBuilder() => new ProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
        title == other.title &&
        imageName == other.imageName &&
        cost == other.cost;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, title.hashCode), imageName.hashCode), cost.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('title', title)
          ..add('imageName', imageName)
          ..add('cost', cost))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _imageName;
  String get imageName => _$this._imageName;
  set imageName(String imageName) => _$this._imageName = imageName;

  double _cost;
  double get cost => _$this._cost;
  set cost(double cost) => _$this._cost = cost;

  ProductBuilder();

  ProductBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _imageName = _$v.imageName;
      _cost = _$v.cost;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Product other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Product;
  }

  @override
  void update(void updates(ProductBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Product build() {
    final _$result =
        _$v ?? new _$Product._(title: title, imageName: imageName, cost: cost);
    replace(_$result);
    return _$result;
  }
}
