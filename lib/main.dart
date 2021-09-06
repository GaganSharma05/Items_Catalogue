import 'package:flutter/material.dart';

void main() {
  runApp(OTLogin());
}

class OTLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(child: Text("Welcome to Online tutorial")),
        ),
      ),
    );
  }
}
