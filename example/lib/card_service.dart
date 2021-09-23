import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardService {
  List<Card> returnCards(int numberOfCards) {
    List<Card> cards = new List.empty(growable: true);
    for (int i = 0; i < numberOfCards; i++) {
      cards.add(Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            ListTile(
              leading: Icon(
                Icons.info_outline,
              ),
              title: Text('Content Card ${(i + 1).toString()}'),
              subtitle: Text(
                  'Cursus mattis molestie a iaculis at erat pellentesque commodo  dui accumsan.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Action 1'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Action 2'),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ));
    }
    return cards;
  }
}
