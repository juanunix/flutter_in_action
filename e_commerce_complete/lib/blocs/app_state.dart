/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_complete/blocs/cart_bloc.dart';
import 'package:e_commerce_complete/blocs/catalog_bloc.dart';
import 'package:e_commerce_complete/blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class AppState extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;
  const AppState({
    Key key,
    @required this.child,
    @required this.blocProvider,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();

  static _AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppStoreContainer)
            as _AppStoreContainer)
        .appData;
  }
}

class _AppState extends State<AppState> {
  BlocProvider get blocProvider => widget.blocProvider;

  @override
  Widget build(BuildContext context) {
    return _AppStoreContainer(
      appData: this,
      blocProvider: widget.blocProvider,
      child: widget.child,
    );
  }

  void dispose() {
    super.dispose();
  }
}

class _AppStoreContainer extends InheritedWidget {
  final _AppState appData;
  final BlocProvider blocProvider;

  _AppStoreContainer({
    Key key,
    @required this.appData,
    @required Widget child,
    @required this.blocProvider,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppStoreContainer oldWidget) =>
      oldWidget.appData != this.appData;
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
  UserBloc userBloc;

  BlocProvider({@required this.cartBloc, @required this.catalogBloc, @required UserBloc this.userBloc});
}
