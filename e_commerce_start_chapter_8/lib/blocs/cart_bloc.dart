/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:shared_lib/e_commerce_app.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final CartService _service;

  // Inputs
  // TODO chapter_8: bloc inputs

  // Outputs
  // TODO chapter_8: bloc outputs

  CartBloc(this._service) {
    // Listen to inputs
    // TODO chapter_8: bloc inputs

    // listen for incoming outputs
    // TODO chapter_8: wire up bloc outputs
  }

  // TODO chapter_8: bloc input handlers
  void _handleAddItemsToCart(AddToCartEvent e) {
    _service.addToCart(e.product, e.qty);
  }

  void _handleRemoveCartItem(RemoveFromCartEvent e) {
    _service.removeFromCart(e.productTitle, e.qtyInCart);
  }

  close() {
//    addProductSink.close();
//    removeFromCartSink.close();
//    _cartItemStreamController.close();
//    _cartItemCountStreamController.close();
  }
}

class AddToCartEvent {
  final Product product;
  final int qty;

  AddToCartEvent(this.product, this.qty);
}

class RemoveFromCartEvent {
  final String productTitle;
  final int qtyInCart;

  RemoveFromCartEvent(this.productTitle, this.qtyInCart);
}
