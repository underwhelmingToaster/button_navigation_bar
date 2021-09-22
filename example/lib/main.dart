import 'package:button_navigation_bar/button_navigation_bar.dart';
import 'package:example/card_service.dart';
import 'package:example/sub_pages/subpage1.dart';
import 'package:example/sub_pages/subpage2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Nav Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int cardCounter = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: CardService().returnCards(cardCounter),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNavigationBar(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        children: [
          ButtonNavigationItem(
              icon: Icons.map_outlined,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SubPageOne()));
              }),
          ButtonNavigationItem(
              icon: Icons.add,
              label: "Add a card",
              width: 140,
              onPressed: () {
                setState(() {
                  cardCounter++;
                });
              }),
          ButtonNavigationItem(
              icon: Icons.search,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SubPageTwo()));
              })
        ],
      ),
    );
  }
}
