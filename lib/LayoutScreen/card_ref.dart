import 'package:flutter/material.dart';

class CardRef extends StatelessWidget {
  const CardRef({
    Key key,
    @required this.refTEC,
    @required this.clientTEC,
    @required this.siteTEC,
  }) : super(key: key);

  final TextEditingController refTEC;
  final TextEditingController clientTEC;
  final TextEditingController siteTEC;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Reference'),
              controller: refTEC,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Client'),
              controller: clientTEC,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Site'),
              controller: siteTEC,
            ),
          ],
        ),
      ),
    );
  }
}
