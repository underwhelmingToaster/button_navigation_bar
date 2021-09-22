import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(child: Text("This is a subpage.")),
    );
  }
}
