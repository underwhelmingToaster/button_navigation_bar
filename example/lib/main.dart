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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  const ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.lightBlue,),
                    title: Text('Content Card 1'),
                    subtitle: Text('Cursus mattis molestie a iaculis at erat pellentesque commodo  dui accumsan.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Action 1'),
                        onPressed: () { },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Action 2'),
                        onPressed: () { },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  const ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.lightBlue,),
                    title: Text('Content Card 2'),
                    subtitle: Text('Cursus mattis molestie a iaculis at erat pellentesque commodo  dui accumsan.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Action 1'),
                        onPressed: () { },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Action 2'),
                        onPressed: () { },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  const ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.lightBlue,),
                    title: Text('Content Card 3'),
                    subtitle: Text('Cursus mattis molestie a iaculis at erat pellentesque commodo  dui accumsan.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Action 1'),
                        onPressed: () { },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Action 2'),
                        onPressed: () { },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
