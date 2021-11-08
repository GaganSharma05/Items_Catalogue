import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String name = "Gagan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Tutorials"),
      ),
      body: Center(
        child: Container(child: Text("Welcome to Online tutorial $name")),
      ),
      drawer: Drawer(),
    );
  }
}
