/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_start_chapter_8/blocs/cart_bloc.dart';
import 'package:e_commerce_start_chapter_8/blocs/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class AppStateManager extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;
  const AppStateManager({
    Key key,
    @required this.child,
    @required this.blocProvider,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();

  /// TODO chapter 8: write an `of` method.
  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppStateContainer)
            as _AppStateContainer)
        .appData;
  }
}

class AppState extends State<AppStateManager> {
  BlocProvider get blocProvider => widget.blocProvider;

  /// TODO chapter 8: implement initial InheritedWidget method
  /// The following two members aren't needed once you've
  /// begin implementing the blocs.
  int cartCount = 0;
  void updateCartCount(int count) {
    setState(() => cartCount += count);
  }
  /// end region

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppStateContainer(
      appData: this,
      child: widget.child,
    );
  }
}

// TODO chapter_8: implement inherited widget
class _AppStateContainer extends InheritedWidget {
  final AppState appData;

  _AppStateContainer({
    Key key,
    @required this.appData,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class RouteChangeEvent {
  final String route;

  RouteChangeEvent(this.route);
}

class ServiceProvider {
  final CatalogService catalogService;
  final CartService cartService;

  ServiceProvider({
    @required this.catalogService,
    @required this.cartService,
  });
}

class BlocProvider {
  CartBloc cartBloc;
  CatalogBloc catalogBloc;

  BlocProvider({@required this.cartBloc, @required this.catalogBloc});
}
