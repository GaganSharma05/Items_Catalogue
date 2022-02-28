import 'package:flutter/material.dart';
import 'package:flutter_catalogue/core/store.dart';
import 'package:flutter_catalogue/pages/cart_page.dart';
// ignore: unused_import
import 'package:flutter_catalogue/pages/home.dart';
import 'package:flutter_catalogue/pages/login_page.dart';
import 'package:flutter_catalogue/utils/MyRoutes.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: OTLogin()));
}

class OTLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      //darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => Login_Page(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => Login_Page(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
