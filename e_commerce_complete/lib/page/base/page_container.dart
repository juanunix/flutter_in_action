import 'package:e_commerce_complete/menu/app_menu_drawer.dart';
import 'package:e_commerce_complete/page/base/page_base.dart';
import 'package:e_commerce_complete/page/cart_page.dart';
import 'package:e_commerce_complete/page/catalog_page.dart';
import 'package:e_commerce_complete/page/product_detail_page.dart';
import 'package:e_commerce_complete/page/user_settings_page.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class PageContainer extends PageContainerBase {
  final PageType pageType;

  PageContainer({@required this.pageType});
  @override
  Widget get menuDrawer => AppMenu();

  @override
  String get pageTitle => pageType.toString().split(".")[1];

  @override
  Widget get body {
    var page;
    switch (pageType) {
      case PageType.Cart:
        page = CartPage();
        break;
      case PageType.Settings:
        page = UserSettingsPage();
        break;
      case PageType.Catalog:
      default:
        page = CatalogPage();
    }
    return Padding(
      padding: EdgeInsets.all(Spacing.matGridUnit()),
      child: page,
    );
  }
}

class ProductDetailPageContainer extends PageContainerBase {
  final Product product;

  ProductDetailPageContainer({@required this.product});

  @override
  Widget get body => ProductDetailPage(product: product);

  @override
  String get pageTitle => product.title;

  @override
  Widget get menuDrawer => null;
}
