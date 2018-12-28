import 'package:e_commerce_complete/blocs/app_bloc.dart';
import 'package:e_commerce_complete/page/base/page_base.dart';
import 'package:e_commerce_complete/page/base/page_container.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

void main() {
  /// Wrap the app in the AppMenuController
  /// An inherited widget which keeps track of
  /// the state of the app, including the
  /// active page
  runApp(AppMenuController(
    child: ECommerceApp(),
  ));
}

class ECommerceApp extends StatefulWidget {
  @override
  _ECommerceAppState createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  @override
  Widget build(BuildContext context) {
    var _theme = ThemeData(
      backgroundColor: AppColors.background,
      scaffoldBackgroundColor: AppColors.background,
      // content
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
      accentColor: AppColors.primary,
      primaryIconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: AppColors.displayTextColor),
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
