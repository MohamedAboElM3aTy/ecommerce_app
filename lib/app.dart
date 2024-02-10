import 'package:ecommerce_app/utilities/routes/router.dart';
import 'package:ecommerce_app/utilities/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyEcommerceApp extends StatelessWidget {
  const MyEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        theme: appTheme(context),
      ),
    );
  }
}
