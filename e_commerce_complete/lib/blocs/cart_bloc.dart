import 'dart:async';

import 'package:flutter_firebase_repository/cart_service.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final FlutterCartService _service;

  // Inputs
  final _addProductController = new StreamController<Product>();
  void addToCart(Product product, int qty) {
    var productForCart = new Product((b) => b
      ..id = product.id
      ..title = product.title
      ..imageTitle = product.imageTitle
      ..category = product.category
      ..quantityInCart = qty
      ..cost = product.cost);

    return _addProductController.sink.add(productForCart);
  }

  // Outputs
  Stream<List<Product>> get cartItems => _cartItemStreamController.stream;
  StreamController _cartItemStreamController =
      new BehaviorSubject<List<Product>>();

  Stream<int> get cartItemCount => _cartItemCountStreamController.stream;
  StreamController _cartItemCountStreamController =
      new BehaviorSubject<int>(seedValue: 0);

  CartBloc(this._service) {
    _addProductController.stream.listen((_handleNewCartItems));
    _service
        .streamCartCount()
        .listen((int count) => _cartItemCountStreamController.add(count));
  }

  _handleNewCartItems(Product p) {
    _service.updateCart(p);
  }

  close() {
    _addProductController.close();
    _cartItemStreamController.close();
    _cartItemCountStreamController.close();
  }
}
