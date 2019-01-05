import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';

class AddToCartBottomSheet extends StatefulWidget {

  const AddToCartBottomSheet({Key key}) : super(key: key);

  @override
  _AddToCartBottomSheetState createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int _quantity = 0;


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height / 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(Spacing.matGridUnit()),
            child: Text(
              "Add item to Cart",
              style: Theme.of(context).primaryTextTheme.display1,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: Spacing.matGridUnit(scale: 3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  iconSize: 40.0,
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (_quantity > 0) {
                      setState(() => _quantity--);
                    }
                  },
                ),
                Text(
                  _quantity.toString(),
                  style: Theme.of(context).primaryTextTheme.headline,
                ),
                IconButton(
                  iconSize: 40.0,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() => _quantity++);
                  },
                )
              ],
            ),
          ),
          RaisedButton(
            color: AppColors.primary[100],
            child: Text(
              "Add To Cart".toUpperCase(),
            ),
            onPressed: () => Navigator.of(context).pop(_quantity),
          )
        ],
      ),
    );
  }
}