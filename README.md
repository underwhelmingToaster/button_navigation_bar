# button_navigation_bar

A navigation bar widget which provides an alternate look to the default menu bar. 

Implementation is easy and enables a customizable look.

# Usage

When using this Widget as a Navbar, the `floatingactionbutton` property of a `Scaffold()` can be used for 
desired positioning of the Widget, as seen in the two examples below.

![Floating Navbar](https://raw.githubusercontent.com/underwhelmingToaster/button_navigation_bar/master/example/images/floatingDemo.png "Floating Navbar") |![Docked Navbar](https://raw.githubusercontent.com/underwhelmingToaster/button_navigation_bar/master/example/images/dockedDemo.png "Docked Navbar") |![Expandable Demo](https://raw.githubusercontent.com/underwhelmingToaster/button_navigation_bar/master/example/images/expandableDemo.png "Expandable Demo") 
----------|----------|---------
Floating Navbar | Docked Navbar | Expandable menu buttons 

For making a basic navbar, place a `ButtonNavigationBar` into the `floatingActionButton:` property and fill it with one or more `ButtonNavigationItem`.

```dart 
return Scaffold(
     appBar: appBar(context),
     body: body(context),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     floatingActionButton: ButtonNavigationBar(
       borderRadius: BorderRadius.all(Radius.circular(10)),
       children: [
         ButtonNavigationItem(
             icon: Icon(Icons.map_outlined),
             onPressed: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (BuildContext context) => SubPageOne()));
             }),
         ButtonNavigationItem(
             icon: Icon(Icons.add),
             label: "Add a card",
             width: 140,
             onPressed: () {
               setState(() {
                 cardCounter++;
               });
             }),
         ButtonNavigationItem(
             icon: Icon(Icons.search),
             onPressed: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (BuildContext context) => SubPageTwo()));
             }),
       ],
     ),
);
```
More advanced code snippets (e.g. the two nav bars displayed [above](https://pub.dev/packages/button_navigation_bar#usage)) can be found [here](https://github.com/underwhelmingToaster/button_navigation_bar/blob/master/example/lib/main.dart).


# Contributing to this plugin

This plugin is still very much in the early stages of development, so any contribution in form of 
plugin development, examples or tests is greatly appreciated. See our [GitHub](https://github.com/underwhelmingToaster/button_navigation_bar) for more information.
