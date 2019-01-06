import 'package:e_commerce_complete/blocs/app_bloc.dart';
import 'package:e_commerce_complete/blocs/cart_bloc.dart';
import 'package:e_commerce_complete/blocs/catalog_bloc.dart';
import 'package:e_commerce_complete/page/base/page_container.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:e_commerce_complete/widget/add_to_cart_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:e_commerce_complete/widget/product_detail_card.dart';
import 'package:shared_lib/e_commerce_app.dart';

class Catalog extends StatelessWidget {
  Future _toProductDetailPage(Product product, BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPageContainer(
              product: product,
            ),
      ),
    );
  }

  void _showQuickAddToCart(BuildContext context, Product product) async {
    var _cartService = AppBloc.of(context).provider.cartService;
    var _cartBloc = new CartBloc(_cartService);

    int qty = await showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return AddToCartBottomSheet(
            key: Key(product.id),
          );
        });

    _addToCart(product, qty, _cartBloc);
  }

  void _addToCart(Product product, int quantity, CartBloc _bloc) {
    _bloc.addToCart(product, quantity);
  }

  @override
  Widget build(BuildContext context) {
    var _service = AppBloc.of(context).provider.catalogService;
    var _bloc = new CatalogBloc(_service);

    return CustomScrollView(
      slivers: <Widget>[
        CustomSliverHeader(
          headerText: "Products",
        ),
        StreamBuilder(
            stream: _bloc.allProducts,
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              return SliverGrid(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var _product = snapshot.data[index];
                    return ProductDetailCard(
                      key: ValueKey(_product.imageTitle.toString()),
                      onTap: () => _toProductDetailPage(_product, context),
                      onLongPress: () => _showQuickAddToCart(context, _product),
                      product: _product,
                    );
                  },
                  childCount: snapshot.data?.length ?? 0,
                ),
              );
            }),
      ],
    );
  }
}

class CustomSliverHeader extends StatelessWidget {
  final double scrollPosition;
  final String headerText;
  final GestureTapCallback onTap;

  const CustomSliverHeader(
      {Key key, this.scrollPosition, this.headerText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: Spacing.matGridUnit(scale: 4),
        maxHeight: Spacing.matGridUnit(scale: 8),
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                      decoration: BoxDecoration(color: AppColors.textColor),
                      height: .5),
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: Spacing.matGridUnit()),
                    decoration:
                        BoxDecoration(color: Theme.of(context).backgroundColor),
                    child: Text(
                      headerText,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
