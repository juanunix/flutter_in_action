import 'package:e_commerce_complete/blocs/app_bloc.dart';
import 'package:e_commerce_complete/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class AppBarCartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _service = AppBloc.of(context).provider.cartService;
    var _bloc = CartBloc(_service);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Stack(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            // buttons are disabled if `onPressed` is null
            onPressed: () =>
                Navigator.of(context).pushNamed(ECommerceRoutes.cartPage),
          ),
          new Positioned(
            top: 4.0,
            right: 4.0,
            child: new Container(
              alignment: Alignment.center,
              width: 16.0,
              height: 16.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: StreamBuilder(
                initialData: 0,
                stream: _bloc.cartItemCount,
                builder: (BuildContext context, AsyncSnapshot snapshot) => Text(
                      snapshot.data.toString(),
                      style: new TextStyle(fontSize: 8.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
