import 'package:e_commerce_complete/page/cart_page.dart';
import 'package:e_commerce_complete/page/catalog_page.dart';
import 'package:e_commerce_complete/page/user_settings_page.dart';
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
    return MaterialApp(
      routes: {
        ECommerceRoutes.catalogPage: (context) =>  CatalogPage(),
        ECommerceRoutes.cartPage: (context) => CartPage(),
        ECommerceRoutes.userSettingsPage: (context) => UserSettingsPage(),
      }
    );
  }
}

