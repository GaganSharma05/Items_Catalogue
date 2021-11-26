import 'package:flutter/material.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  final String name = "Vegetables";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suprabhat -- Welcome to Fresh World"),
      ),
      body: Center(
        child: Container(child: Text("Welcome to Online shopping $name")),
      ),
      drawer: MyDrawer(),
    );
  }
}
