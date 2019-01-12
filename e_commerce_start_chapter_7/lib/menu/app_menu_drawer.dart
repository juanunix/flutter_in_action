/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:e_commerce_start_chapter_7/blocs/app_bloc.dart';
import 'package:e_commerce_start_chapter_7/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';


// TODO: the whole thing
class AppMenu extends StatelessWidget {
  Future _navigate(BuildContext context, String route) async {
    AppBloc.of(context).activeRoute = route;
    await Navigator.pushNamed(context, route); // TODO: push named
  }

  Widget _buildTile(
      {@required String title,
      @required IconData icon,
      @required bool isActive,
      GestureTapCallback onTap}) {
    var iconWidget =
        isActive ? Icon(icon, color: AppColors.primary[700]) : Icon(icon);
    var titleWidget = isActive
        ? Text(title, style: TextStyle(color: AppColors.primary[700]))
        : Text(title);

    var tile = ListTile(
      leading: iconWidget,
      title: titleWidget,
      onTap: onTap,
    );

    return isActive
        ? Container(
            decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(10.0)),
            child: tile,
            margin: EdgeInsets.all(Spacing.matGridUnit()),
          )
        : Container(child: tile);
  }

  @override
  Widget build(BuildContext context) {
    var activeRoute = AppBloc.of(context).activeRoute; // TODO: Ignore in this chapter

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/apple-in-hand.jpg"),
            ),
            accountEmail: Text("eric@ericwindmill.com"),
            accountName: Text("Eric Windmill"),
            onDetailsPressed: () {
              Navigator.pushReplacementNamed( // TODO: push replacement named ???
                  context, ECommerceRoutes.userSettingsPage);
            },
          ),
          _buildTile(
              title: "Catalog",
              icon: Icons.apps,
              isActive: activeRoute == ECommerceRoutes.catalogPage,
              onTap: () => _navigate(context, ECommerceRoutes.catalogPage)), // TODO: navgate
          _buildTile(
            title: "Shopping Cart",
            icon: Icons.shopping_cart,
            isActive: activeRoute == ECommerceRoutes.cartPage,
            onTap: () => _navigate(context, ECommerceRoutes.cartPage),
          ),
          _buildTile(
            icon: Icons.person,
            title: "User Settings",
            isActive: activeRoute == ECommerceRoutes.userSettingsPage,
            onTap: () => _navigate(context, ECommerceRoutes.userSettingsPage),
          ),
          AboutListTile( // TODO: Mention this??
            icon: Icon(Icons.info),
            applicationName: "Produce Store",
            aboutBoxChildren: <Widget>[
              Text("Thanks for reading Flutter in Action!"),
            ],
          ),
        ],
      ),
    );
  }
}
