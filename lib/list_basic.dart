import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/models/destination.dart';
import 'package:flutter_fieldsheet/models/odour.dart';
import 'package:flutter_fieldsheet/services/database.dart';
import 'package:provider/provider.dart';

class ListBasic extends StatelessWidget {
  final Destination destination;

  const ListBasic({Key key, this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(primarySwatch: Colors.lime),
      home: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // DropdownUidWidget(),
            OdourListWidget(),
          ],
        ),
      ),
    );
  }
}

class OdourListWidget extends StatefulWidget {
  @override
  _OdourListWidgetState createState() => _OdourListWidgetState();
}

class _OdourListWidgetState extends State<OdourListWidget> {
  String searchUID = 'null';

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<Database>(context);

    return Material(
      child: StreamBuilder<List<Odour>>(
          stream: searchUID == 'null'
              ? db.odoursStream()
              : db.odourStream(odourUID: searchUID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var odour = snapshot.data;
              return Center(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  color: Colors.blueGrey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: odour.length,
                        itemBuilder: (context, count) =>
                            Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: ListTile(
                                    title: Text('${odour[count].reference}'),
                                    leading: Text('${odour[count].uid}'),
                                    //, style: TextStyle(fontSize: 12, color: Colors.black),),
                                    subtitle: Text('${odour[count].site}'),
                                    trailing: Text('${odour[count].bag3}'),
                                    // style: TextStyle(fontSize: 13, color: Colors.black),),
                                    onTap: () {
                                      print('WHAT JUST HAPPENED');
                                      setState(() {
                                        searchUID = '1003';
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 2)
                              ],
                            )),
                  ),
                ),
              );
            }
            return Center(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                color: Colors.white,
                child: CircularProgressIndicator(),
              ),
            );
          }),
    );
  }
}

class DropdownUidWidget extends StatefulWidget {
  const DropdownUidWidget({
    Key key,
  }) : super(key: key);

  @override
  _DropdownUidWidgetState createState() => _DropdownUidWidgetState();
}

class _DropdownUidWidgetState extends State<DropdownUidWidget> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: "1",
          child: Text(
            "First",
          ),
        ),
        DropdownMenuItem(
          value: "2",
          child: Text(
            "Second",
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
      value: _value,
      //isExpanded: true,
    );
  }
}
