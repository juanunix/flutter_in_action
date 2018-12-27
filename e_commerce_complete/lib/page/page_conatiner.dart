import 'package:e_commerce_complete/page/catalog_page.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';

enum PageType { catalog, cart, settings, productDetail }

abstract class PageContainerBase extends StatelessWidget {
  final PageType pageType;
  const PageContainerBase({Key key, this.pageType}) : super(key: key);

  Widget get _page {
    switch (pageType) {
      case PageType.cart:
      case PageType.settings:
      case PageType.catalog:
      default:
        return CatalogPage();
    }
  }
}

class PageContainer extends PageContainerBase {
  const PageContainer({Key key, PageType pageType})
      : super(key: key, pageType: pageType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppStyle.matGridUnit()),
        child: _page,
      ),
    );
  }
}
