import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/LayoutScreen/card_bags.dart';
import 'package:flutter_fieldsheet/LayoutScreen/card_extras.dart';
import 'package:flutter_fieldsheet/LayoutScreen/card_ref.dart';
import 'package:flutter_fieldsheet/models/odour.dart';
import 'package:flutter_fieldsheet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class LayoutBasic extends StatefulWidget {
  @override
  _LayoutBasicState createState() => _LayoutBasicState();
}

class _LayoutBasicState extends State<LayoutBasic> {
  String nextUID = 'null';

  String _droppedValue = 'null';

  TextEditingController refTEC = TextEditingController();
  TextEditingController clientTEC = TextEditingController();
  TextEditingController siteTEC = TextEditingController();
  TextEditingController bag1TEC = TextEditingController();
  TextEditingController bag2TEC = TextEditingController();
  TextEditingController bag3TEC = TextEditingController();
  TextEditingController extra1TEC = TextEditingController();
  TextEditingController extra2TEC = TextEditingController();
  TextEditingController extra3TEC = TextEditingController();

  @override
  void dispose() {
    refTEC.dispose();
    clientTEC.dispose();
    siteTEC.dispose();
    bag1TEC.dispose();
    bag2TEC.dispose();
    bag3TEC.dispose();
    extra1TEC.dispose();
    extra2TEC.dispose();
    extra3TEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _droppedValue = 'null';
    super.initState();
  }

  void clearTEC() {
    setState(() {
      refTEC.text = '';
      clientTEC.text = '';
      siteTEC.text = '';
      bag1TEC.text = '';
      bag2TEC.text = '';
      bag3TEC.text = '';
      extra1TEC.text = '';
      extra2TEC.text = '';
      extra3TEC.text = '';

      _droppedValue = 'null';
    });
  }

  void printTEC() {
    setState(() {
      print('RELEASE OF THE ${refTEC.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<Database>(context);

    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Layout'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.lock_open),
                onPressed: () {
                  print('LOCK OUT PRESSED');
                  db.logOut();
                }),
          ],
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
                          shape: BoxShape.rectangle, color: Colors.purple[300]),
                      width: screenSize.width * 0.80,
                      child: Center(
                        child: StreamBuilder<List<Odour>>(
                            stream: db.odoursStream(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == null) {
                                return Container(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasError) {
                                print('Error from the Streambuilder');
                              }
                              if (snapshot.hasData) {
                                var odour = snapshot.data;

                                return DropdownButton<String>(
                                  //value: _droppedValue==null ? 'Select or Enter New      ': _droppedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _droppedValue = value;

                                      var selected = odour.firstWhere(
                                          (element) =>
                                              element.uid.startsWith(value));
                                      refTEC.text = selected.reference;
                                      clientTEC.text = selected.client;
                                      siteTEC.text = selected.site;
                                      bag1TEC.text = selected.bag1;
                                      bag2TEC.text = selected.bag2;
                                      bag3TEC.text = selected.bag3;
                                      extra1TEC.text = selected.spare1;
                                      extra2TEC.text = selected.spare2;
                                      extra3TEC.text = selected.spare3;
                                    });
                                  },
                                  icon: Icon(Icons.beach_access),
                                  iconSize: 25,
                                  style: TextStyle(color: Colors.indigo),
                                  hint: _droppedValue == 'null'
                                      ? Text(
                                          'Select or Enter New          ',
                                          style: TextStyle(fontSize: 28),
                                        )
                                      : Text(
                                          '$_droppedValue          ',
                                          style: TextStyle(fontSize: 28),
                                        ),
                                  elevation: 15,
                                  items: odour.isEmpty
                                      ? 'null'
                                      : odour
                                          .toList()
                                          .map((item) => item.uid)
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                );
                              }

                              return Container(
                                  child: CircularProgressIndicator());
                            }),
                      ),
                    ),

                    ///
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CardRef(
                                refTEC: refTEC,
                                clientTEC: clientTEC,
                                siteTEC: siteTEC),
                          ),
                          Expanded(
                            flex: 1,
                            child: CardBags(
                                bag1TEC: bag1TEC,
                                bag2TEC: bag2TEC,
                                bag3TEC: bag3TEC),
                          ),
                        ],
                      ),
                    ),
                    CardExtras(
                        extra1TEC: extra1TEC,
                        extra2TEC: extra2TEC,
                        extra3TEC: extra3TEC),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  db.lastUID().then((value) {
                    nextUID = ((int.parse(value)) + 1).toString();
                    String uid =
                        _droppedValue == 'null' ? nextUID : _droppedValue;

                    List<String> _zearch = [
                      refTEC.text,
                      clientTEC.text,
                      siteTEC.text,
                      bag1TEC.text,
                      bag2TEC.text,
                      bag3TEC.text,
                      extra1TEC.text,
                      extra2TEC.text,
                      extra3TEC.text,
                      uid
                    ];

                    print('this is uid: $uid or droppedValue $_droppedValue');

                    try {
                      db.setOdour(Odour(
                          reference: refTEC.text,
                          client: clientTEC.text,
                          site: siteTEC.text,
                          bag1: bag1TEC.text,
                          bag2: bag2TEC.text,
                          bag3: bag3TEC.text,
                          spare1: extra1TEC.text,
                          spare2: extra2TEC.text,
                          spare3: extra3TEC.text,
                          zearch: _zearch,
                          uid: uid));

                      setState(() {
                        _droppedValue = uid;
                      });

                      Toast.show('Data Saved', context,
                          duration: Toast.LENGTH_SHORT,
                          gravity: Toast.TOP,
                          backgroundColor: Colors.green);
                    } on Exception catch (e) {
                      print('failed to save the data with: $e');

                    }
                  });
                }),
            SizedOverflowBox(
              size: Size(10, 0),
            ),
            FloatingActionButton(child: Icon(Icons.clear), onPressed: clearTEC)
          ],
        ),
      ),
    );
  }
}
