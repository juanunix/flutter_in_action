/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:shared_lib/e_commerce_app.dart';

class NewProduct {
  double cost;
  String title;
  ProductCategory category;

  @override
  String toString() {
    return 'NewProduct{cost: $cost, title: $title, category: $category}';
  }
}
