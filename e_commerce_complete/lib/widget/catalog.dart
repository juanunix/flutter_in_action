import 'package:e_commerce_complete/page/base/page_container.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:e_commerce_complete/widget/product_detail_card.dart';
import 'package:shared_lib/e_commerce_app.dart';

class Catalog extends StatelessWidget {
//  final List<Product> products = [
//    Product((b) => b
//      ..imageName = "Avocado"
//      ..title = "Avocado"),
//    Product((b) => b
//      ..imageName = "Avocado"
//      ..title = "Avocado"),
//    Product((b) => b
//      ..imageName = "Avocado"
//      ..title = "Avocado"),
//  ];

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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CustomSliverHeader(
          headerText: "Categories",
        ),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ProductDetailCard(
                key: ValueKey(index.toString()),
                onTap: () => _toProductDetailPage(null, context), //TODO
                product: null //TODO,
              );
            },
            childCount: 3,
          ),
        ),
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

//class CollapsingListState extends StatelessWidget {
//  makeHeader() {}
//
//  @override
//  Widget build(BuildContext context) {
//    return CustomScrollView(
//      slivers: <Widget>[
//        SliverGrid.extent(
//          maxCrossAxisExtent: 150.0,
//          children: [
//            ProductDetailCard(),
//          ],
//        ),
//        SliverFixedExtentList(
//          itemExtent: 120.0,
//          delegate: SliverChildListDelegate(
//            [
//              ProductDetailCard(),
//              Container(color: Colors.purple),
//              Container(color: Colors.green),
//              Container(color: Colors.orange),
//              Container(color: Colors.yellow),
//            ],
//          ),
//        ),
//        SliverGrid(
//          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
//            maxCrossAxisExtent: 200.0,
//            mainAxisSpacing: 10.0,
//            crossAxisSpacing: 10.0,
//            childAspectRatio: 4.0,
//          ),
//          delegate: new SliverChildBuilderDelegate(
//            (BuildContext context, int index) {
//              return new Container(
//                alignment: Alignment.center,
//                color: Colors.teal[100 * (index % 9)],
//                child: new Text('grid item $index'),
//              );
//            },
//            childCount: 20,
//          ),
//        ),
//        // Yes, this could also be a SliverFixedExtentList. Writing
//        // this way just for an example of SliverList construction.
//        SliverList(
//          delegate: SliverChildListDelegate(
//            [
//              Container(color: Colors.pink, height: 150.0),
//              Container(color: Colors.cyan, height: 150.0),
//              Container(color: Colors.indigo, height: 150.0),
//              Container(color: Colors.blue, height: 150.0),
//            ],
//          ),
//        ),
//        SliverToBoxAdapter(
//          child: Container(
//            height: 100.0,
//            child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: 10,
//              itemBuilder: (context, index) {
//                return Container(
//                  width: 100.0,
//                  child: Card(
//                    child: Text('data'),
//                  ),
//                );
//              },
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//}
