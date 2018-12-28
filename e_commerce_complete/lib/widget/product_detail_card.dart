import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class ProductDetailCard extends StatelessWidget {
  final Product product;
  final GestureTapCallback onTap;

  const ProductDetailCard({Key key, this.product, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _radius = BorderRadius.circular(10.0);

    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: _radius),
      child: GestureDetector(
        onTap: onTap,
        child: RepaintBoundary(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: _radius,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/half_avo.jpeg',
                ),
              ),
            ),
            child: Container(
              constraints: BoxConstraints.expand(
                height: Spacing.matGridUnit(scale: 5),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(
                Spacing.matGridUnit(scale: .5),
              ),
              child: Center(
                child: Text(product.title,
                    style: Theme.of(context).primaryTextTheme.subhead),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
