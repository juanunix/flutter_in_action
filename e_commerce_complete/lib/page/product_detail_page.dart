import 'package:e_commerce_complete/blocs/app_bloc.dart';
import 'package:e_commerce_complete/blocs/cart_bloc.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key key, this.product}) : super(key: key);

  @override
  ProductDetailPageState createState() {
    return new ProductDetailPageState();
  }
}

class ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    var _cartService = AppBloc.of(context).provider.cartService;
    var _cartBloc = new CartBloc(_cartService);

    return Stack(
      children: <Widget>[
        BackgroundImage(),
        Positioned(
          bottom: 10.0,
          left: 30.0, // half of the "padding" we added in the containers width
          child: Container(
            padding: EdgeInsets.all(Spacing.matGridUnit(scale: 3)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 1.0),
                ]),
            width: MediaQuery.of(context).size.width - 60.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.product.title,
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(color: AppColors.displayTextColor),
                        ),
                        Text(
                          widget.product.category.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "\$ ${widget.product.cost} / lb",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: AppColors.displayTextColor),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Spacing.matGridUnit(scale: 2)),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Hero(
                          tag: widget.product.title,
                          child: Image.asset(widget.product.imageUrl),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("This is a nice thing you can buy."),
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        if (_quantity > 0) {
                          setState(() => _quantity--);
                        }
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      _quantity.toString(),
                      style: Theme.of(context).primaryTextTheme.headline,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => _quantity++);
                      },
                      icon: Icon(Icons.add),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      onPressed: () =>
                          _cartBloc.addToCart(widget.product, _quantity),
                      textColor: Colors.white,
                      child: Text("Add to Cart"),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .75,
      child: ClipPath(
        clipper: BackgroundImageClipper(),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/images/fruit_stand.png"),
          )),
        ),
      ),
    );
  }
}

class BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height); // bottom left corner
    path.lineTo(size.width - 150.0, size.height);
    path.lineTo(size.width, size.height - 150.0); // bottom right corner
    path.lineTo(size.width, 0.0); // top right corner

    // Draws a straight line from current point to the first point of the path.
    // In this case (0, 0), since that's where the paths start by default.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
