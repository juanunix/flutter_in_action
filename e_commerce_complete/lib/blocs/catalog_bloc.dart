import 'dart:async';

import 'package:shared_lib/e_commerce_app.dart';
import 'package:rxdart/rxdart.dart';

class CatalogBloc {
  final CatalogService _service;

  // Output products
  Stream<List<Product>> get allProducts => _productStreamController.stream;
  StreamController _productStreamController =
      new BehaviorSubject<List<Product>>(seedValue: []);

  // Inputs
  final _productInputController =
      new StreamController<ProductEvent>.broadcast();
  Sink<ProductEvent> get addNewProduct => _productInputController.sink;
  Sink<ProductEvent> get updateProduct => _productInputController.sink;

  CatalogBloc(this._service) {
    _productInputController.stream
        .where((ProductEvent event) => event is UpdateProductEvent)
        .listen(_handleProductUpdate);
    _productInputController.stream
        .where((ProductEvent event) => event is AddProductEvent)
        .listen(_handleAddProduct);
    _service
        .streamProducts()
        .listen((List<Product> data) => _productStreamController.add(data));
  }

  _handleProductUpdate(ProductEvent event) {
    _service.addNewProduct(event.product);
  }

  _handleAddProduct(ProductEvent event) {
    _service.updateProduct(event.product);
  }

  void close() {
    _productStreamController.close();
    _productInputController.close();
  }
}

class ProductEvent {
  Product product;
}

class AddProductEvent extends ProductEvent {}

class UpdateProductEvent extends ProductEvent {}
