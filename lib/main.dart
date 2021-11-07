import 'package:flutter/material.dart' ;
//import 'package:flutter_catalogue/home.dart';
import 'package:flutter_catalogue/pages/login_page.dart';
import 'package:flutter_catalogue/'

void main() {
  runApp(OTLogin());
}

class OTLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: "\login",
        routes: {
          "/": (context) => Login_Page(),
          //  "/login": (context) => Login_Page()
        });
  }
}
