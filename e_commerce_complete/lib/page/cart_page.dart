import 'package:e_commerce_complete/blocs/app_bloc.dart';
import 'package:e_commerce_complete/blocs/cart_bloc.dart';
import 'package:e_commerce_complete/widget/catalog.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _service = AppBloc.of(context).provider.cartService;
    var _bloc = new CartBloc(_service);

    return CustomScrollView(
      slivers: <Widget>[
        CustomSliverHeader(
          headerText: "Cart",
        ),
        StreamBuilder(
          stream: _bloc.cartItems,
          initialData: <String, int>{},
          builder:
              (BuildContext context, AsyncSnapshot<Map<String, int>> snapshot) {
            if (snapshot.data.keys.length == 0) {
              return SliverFillRemaining(child: Text("Your cart is empty"));
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var _product = snapshot.data.keys.toList()[index];
                  var qty = snapshot.data[_product];
                  return Card(
                      child: Column(
                    children: <Widget>[
                      Text(_product),
                      Text(qty.toString()),
                    ],
                  ));
                },
                childCount: snapshot.data.keys.toList().length,
              ),
            );
          },
        )
      ],
    );
  }
}
