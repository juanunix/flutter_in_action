import 'package:e_commerce_complete/page/cart_page.dart';
import 'package:e_commerce_complete/page/page_conatiner.dart';
import 'package:e_commerce_complete/page/user_settings_page.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

void main() => runApp(ECommerceApp());

class ECommerceApp extends StatefulWidget {
  @override
  _ECommerceAppState createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  @override
  Widget build(BuildContext context) {
    var _theme = ThemeData(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppStyle.primaryTextColor,
            displayColor: AppStyle.displayTextColor,
          ),
      backgroundColor: AppStyle.background,
      accentTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppStyle.textColorLight,
            displayColor: AppStyle.textColorLight,
          ),
    );

    return MaterialApp(
      theme: _theme,
      routes: {
        ECommerceRoutes.catalogPage: (context) =>
            PageContainer(pageType: PageType.catalog),
        ECommerceRoutes.cartItemDetailPage: (context) =>
            PageContainer(pageType: PageType.cart),
      },
    );
  }
}
