import 'package:flutter/material.dart';

class CardExtras extends StatelessWidget {
  const CardExtras({
    Key key,
    @required this.extra1TEC,
    @required this.extra2TEC,
    @required this.extra3TEC,
  }) : super(key: key);

  final TextEditingController extra1TEC;
  final TextEditingController extra2TEC;
  final TextEditingController extra3TEC;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Extra One'),
              controller: extra1TEC,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Extra Two'),
              controller: extra2TEC,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Extra Three'),
              controller: extra3TEC,
            ),
            Text('<End>')
          ],
        ),
      ),
    );
  }
}
