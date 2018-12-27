import 'package:e_commerce_complete/page/page_conatiner.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class ProductDetailPageContainer extends PageContainerBase {
  final Product product;

  ProductDetailPageContainer({pageType, this.product})
      : super(pageType: pageType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppStyle.matGridUnit()),
        child: new Text(product.title),
      ),
    );
  }
}
