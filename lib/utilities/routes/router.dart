import 'package:ecommerce_app/utilities/routes/routes.dart';
import 'package:ecommerce_app/view/pages/auth_page.dart';
import 'package:ecommerce_app/view/pages/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authPage:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.navBarPage:
      return CupertinoPageRoute(
        builder: (_) => const MyBottomNavBar(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
  }
}
