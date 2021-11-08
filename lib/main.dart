import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_catalogue/pages/home.dart';
import 'package:flutter_catalogue/pages/login_page.dart';
import 'package:flutter_catalogue/utils/MyRoutes.dart';

void main() {
  runApp(OTLogin());
}

class OTLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => Login_Page(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => Login_Page()
      },
    );
  }
}
