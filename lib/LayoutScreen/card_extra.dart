import 'package:flutter/material.dart';

class CardExtra extends StatelessWidget {
  const CardExtra({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Extra One'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Extra Two'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Extra Three'),
            ),
            Text('<End>')
          ],
        ),
      ),
    );
  }
}
