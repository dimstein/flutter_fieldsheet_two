import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fieldsheet/LayoutScreen/card_bags.dart';
import 'package:flutter_fieldsheet/LayoutScreen/card_extra.dart';
import 'package:flutter_fieldsheet/LayoutScreen/card_ref.dart';

class LayoutBasic extends StatefulWidget {
  @override
  _LayoutBasicState createState() => _LayoutBasicState();
}

class _LayoutBasicState extends State<LayoutBasic> {
  String _value = '1';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.blueGrey[200],
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.grey[300]),
                    width: screenSize.width * 0.80,
                    child: Center(
                      child: DropdownButton<String>(
                          elevation: 20,
                          icon: Icon(Icons.add_shopping_cart),
                          dropdownColor: Colors.amber,
                          items: [
                            DropdownMenuItem(
                                child: Text('  One  '), value: '1'),
                            DropdownMenuItem(
                                child: Text('  Two  '), value: '2'),
                            DropdownMenuItem(
                                child: Text('  Three  '), value: '3')
                          ],
                          value: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: CardRef()),
                        Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              child: CardBags(),
                            )),
                      ],
                    ),
                  ),
                  CardExtra(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
