import 'package:flutter/material.dart';

class CardBags extends StatelessWidget {
  const CardBags({
    Key key,
    @required this.bag1TEC,
    @required this.bag2TEC,
    @required this.bag3TEC,
  }) : super(key: key);

  final TextEditingController bag1TEC;
  final TextEditingController bag2TEC;
  final TextEditingController bag3TEC;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Bag 1'),
              controller: bag1TEC,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Bag 2'),
              controller: bag2TEC,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Bag 3'),
              controller: bag3TEC,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
