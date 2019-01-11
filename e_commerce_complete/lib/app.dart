/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_complete/page/base/page_base.dart';
import 'package:e_commerce_complete/page/base/page_container.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class ECommerceApp extends StatefulWidget {
  @override
  _ECommerceAppState createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  @override
  Widget build(BuildContext context) {
    /// All constants can be found in [utils/styles.dart]
    var _theme = ThemeData(
      // content
      backgroundColor: AppColors.background,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.textColor,
            displayColor: AppColors.textColor,
          ),
      // headings -- contrasts 'primary color'
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.displayTextColor,
            displayColor: AppColors.displayTextColor,
          ),
      // ui -- contrasts 'accent color'
      accentTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.accentTextColor,
            displayColor: AppColors.accentTextColor,
          ),
      primaryColor: AppColors.primary,
      accentColor: AppColors.accent,
      primaryIconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: AppColors.displayTextColor),
      buttonColor: AppColors.primary[500],
    );

    return MaterialApp(
      theme: _theme,
      routes: {
        ECommerceRoutes.catalogPage: (context) =>
            PageContainer(pageType: PageType.Catalog),
        ECommerceRoutes.cartPage: (context) =>
            PageContainer(pageType: PageType.Cart),
        ECommerceRoutes.userSettingsPage: (context) =>
            PageContainer(pageType: PageType.Settings),
      },
    );
  }
}
