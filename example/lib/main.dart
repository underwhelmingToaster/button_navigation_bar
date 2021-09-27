import 'package:button_navigation_bar/button_navigation_bar.dart';
import 'package:button_navigation_bar/button_navigation_expandable.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  int example = 1;
  int cardCounter = 2;

  @override
  Widget build(BuildContext context) {
    switch (example) {
      case 1:
        return example1(context);
      case 2:
        return example2(context);
      default:
        throw "Example nr. $example is not implemented";
    }
  }

  Scaffold example1(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonNavigationBar(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
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
              onPressed: () {
                setState(() {
                  cardCounter++;
                });
              }),
          ButtonNavigationItem.expandable(
              expandableSpacing: 56.0,
              verticalOffset: 56.0,
              icon: Icons.expand_less,
              collapseButton: ButtonNavigationItem(
                  onPressed: () {}, color: Colors.blueGrey, icon: Icons.close),
              children: [
                ButtonNavigationExpandable(
                  onPressed: () {},
                  label: "Option 1",
                  height: 40,
                  width: 128,
                  icon: Icons.info,
                ),
                ButtonNavigationExpandable(
                    onPressed: () {}, height: 40, width: 96, label: "Option 2"),
              ]),
          ButtonNavigationItem(
              icon: Icons.remove,
              onPressed: () {
                setState(() {
                  if (cardCounter > 1) {
                    cardCounter--;
                  }
                });
              }),
          ButtonNavigationItem(
              icon: Icons.view_stream_sharp,
              onPressed: () {
                setState(() {
                  cardCounter = 2;
                });
              }),
        ],
      ),
    );
  }

  Scaffold example2(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
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
              }),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  onTap: () {
                    setState(() {
                      example = 1;
                    });
                  },
                  child: InkWell(
                    splashColor: Colors.grey,
                    child: Text("Example 1"),
                  )),
              PopupMenuItem(
                  onTap: () {
                    setState(() {
                      example = 2;
                    });
                  },
                  child: InkWell(
                    splashColor: Colors.grey,
                    child: Text("Example 2"),
                  ))
            ];
          },
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: CardService().returnCards(cardCounter),
        ));
  }
}
