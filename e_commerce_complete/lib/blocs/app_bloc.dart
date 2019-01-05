import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_repository/cart_service.dart';
import 'package:flutter_firebase_repository/catalog_service.dart';

class AppBloc extends StatefulWidget {
  final Widget child;
  final ServiceProvider provider;
  const AppBloc({Key key, this.child, this.provider}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppBlocState();
  }

  static AppBlocState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppBlocContainer)
            as _AppBlocContainer)
        .appData;
  }
}

class AppBlocState extends State<AppBloc> {
  String _activeRoute = '/'; // Initially, "home" is selected
  String get activeRoute => _activeRoute;
  set activeRoute(String route) {
    if (_activeRoute == route) return;
    _activeRoute = route;
  }

  ServiceProvider get provider => widget.provider;

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppBlocContainer(
      appData: this,
      provider: widget.provider,
      child: widget.child,
    );
  }
}

class _AppBlocContainer extends InheritedWidget {
  final AppBlocState appData;
  final ServiceProvider provider;

  _AppBlocContainer({
    Key key,
    @required this.appData,
    @required Widget child,
    @required this.provider,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class RouteChangeEvent {
  final String route;

  RouteChangeEvent(this.route);
}

class ServiceProvider {
  final FlutterCatalogService catalogService;
  final FlutterCartService cartService;

  ServiceProvider({@required this.catalogService, @required this.cartService});
}
