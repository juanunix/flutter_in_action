import 'dart:async';
import 'package:flutter/material.dart';

class AppMenuController extends StatefulWidget {
  final Widget child;
  const AppMenuController({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppMenuControllerState();
  }

  static AppMenuControllerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_AppMenuControllerContainer)
            as _AppMenuControllerContainer)
        .controller;
  }
}

class AppMenuControllerState extends State<AppMenuController> {
  String _activeRoute = '/'; // Initially, "home" is selected
  String get activeRoute => _activeRoute;
  set activeRoute(String route) {
    if (_activeRoute == route) return;
    _activeRoute = route;
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppMenuControllerContainer(
      controller: this,
      child: widget.child,
    );
  }
}

class _AppMenuControllerContainer extends InheritedWidget {
  final AppMenuControllerState controller;

  _AppMenuControllerContainer({
    Key key,
    @required this.controller,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class RouteChangeEvent {
  final String route;

  RouteChangeEvent(this.route);
}
