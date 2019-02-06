/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:e_commerce_complete/page/add_product_form.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_lib/e_commerce_app.dart';

class UserBloc {
  final UserService _service;

  //Inputs
  StreamController updateUserInformationSink =
      new StreamController<UpdateUserEvent>();
  StreamController<NewUserProductEvent> addNewProductToUserProductsSink =
      new StreamController<NewUserProductEvent>();

  // Outputs
  Stream<ECommerceUser> get user => _userStreamController.stream;
  StreamController _userStreamController = new BehaviorSubject<ECommerceUser>(
      seedValue: ECommerceUser(
          name: "Eric Windmill", contact: "eric@ericwindmill.com"));

  UserBloc(this._service) {
    updateUserInformationSink.stream.listen(_handleNewUserInformation);
    addNewProductToUserProductsSink.stream.listen(_handleNewUserProduct);
    _service.streamUserInformation().listen((ECommerceUser data) {
      _userStreamController.add(data);
    });
  }

  _handleNewUserInformation(dynamic data) {}

  _handleNewUserProduct(NewUserProductEvent event) {
    var product = new Product((b) => b
      ..category = event.product.category
      ..title = event.product.title
      ..cost = event.product.cost
      ..imageTitle = ImageTitle.SlicedOranges); // This
    _service.addUserProduct(product);
  }

  close() {
    updateUserInformationSink.close();
    addNewProductToUserProductsSink.close();
    _userStreamController.close();
  }
}

class NewUserProductEvent {
  final NewProduct product;

  NewUserProductEvent(this.product);
}

class UpdateUserEvent {
  ECommerceUser user;
}
