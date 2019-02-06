/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:shared_lib/e_commerce_app.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_lib/shared_lib.dart';

class CatalogBloc {
  final CatalogService _service;

  // TODO chapter_8: implement bloc inputs

  // TODO chapter_8: implement bloc outputs

  CatalogBloc(this._service) {
    // TODO chapter_8: listen to bloc inputs
    // TODO chapter_8: add to bloc outputs
  }

  _handleProductUpdate(ProductEvent event) {
    _service.addNewProduct(event.product);
  }

  _handleAddProduct(ProductEvent event) {
    _service.updateProduct(event.product);
  }

  void dispose() {
//    _productStreamController.close();
//    _productInputController.close();
//    _controllersByCategory.forEach((controller) => controller.close());
  }
}

class ProductEvent {
  Product product;
}

class AddProductEvent extends ProductEvent {}

class UpdateProductEvent extends ProductEvent {}
