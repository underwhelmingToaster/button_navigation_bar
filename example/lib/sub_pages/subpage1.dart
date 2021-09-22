import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(
        child: Text("This is a subpage.")
      ),
    );
  }

}