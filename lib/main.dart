import 'package:flutter/material.dart';
import 'package:flutter_catalogue/home.dart';
import 'package:flutter_catalogue/login_page.dart';

void main() {
  runApp(OTLogin());
}

class OTLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.indigo),
        routes: {
          "/": (context) => Homepage(),
          "/login": (context) => Login_Page()
        });
  }
}
