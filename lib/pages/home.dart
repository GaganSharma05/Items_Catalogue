import 'package:flutter/material.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  final String name = "Gagan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Onlne Tutorial"),
      ),
      body: Center(
        child: Container(child: Text("Welcome to Online tutorial $name")),
      ),
      drawer: MyDrawer(),
    );
  }
}
