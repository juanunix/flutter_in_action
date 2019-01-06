import 'dart:async';

import 'package:flutter_firebase_repository/cart_service.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final FlutterCartService _service;

  // Inputs
  final _addProductController = new StreamController<AddToCartEvent>();
  void addToCart(Product product, int qty) {
    var productForCart = new Product((b) => b
      ..id = product.id
      ..title = product.title
      ..imageTitle = product.imageTitle
      ..category = product.category
      ..cost = product.cost);

    return _addProductController.sink
        .add(new AddToCartEvent(productForCart, qty));
  }

  // Outputs
  Stream<Map<String, int>> get cartItems => _cartItemStreamController.stream;
  StreamController _cartItemStreamController =
      new BehaviorSubject<Map<String, int>>(seedValue: {});

  Stream<int> get cartItemCount => _cartItemCountStreamController.stream;
  StreamController _cartItemCountStreamController =
      new BehaviorSubject<int>(seedValue: 0);

  CartBloc(this._service) {
    _addProductController.stream.listen((_handleNewCartItems));
    _service
        .streamCartCount()
        .listen((int count) => _cartItemCountStreamController.add(count));
    _service
        .streamCartItems()
        .listen((Map<String, int> data) => _cartItemStreamController.add(data));
  }

  _handleNewCartItems(AddToCartEvent e) {
    _service.updateCart(e.product, e.qty);
  }

  close() {
    _addProductController.close();
    _cartItemStreamController.close();
    _cartItemCountStreamController.close();
  }
}

class AddToCartEvent {
  final Product product;
  final int qty;

  AddToCartEvent(this.product, this.qty);
}
