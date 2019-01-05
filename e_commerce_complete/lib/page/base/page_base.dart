import 'package:e_commerce_complete/utils/styles.dart';
import 'package:e_commerce_complete/widget/appbar_cart_icon.dart';
import 'package:flutter/material.dart';

enum PageType { Catalog, Cart, Settings, ProductDetail }

abstract class PageContainerBase extends StatelessWidget {
  Widget get body;

  String get pageTitle;

  Widget get menuDrawer;

  const PageContainerBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        title: Text(pageTitle),
        textTheme: Theme.of(context).primaryTextTheme,
        actions: <Widget>[
          AppBarCartIcon(),
        ],
      ),
      drawer: menuDrawer,
      body: Padding(
        padding: EdgeInsets.all(Spacing.matGridUnit(scale: 1.5)),
        child: body,
      ),
    );
  }
}
