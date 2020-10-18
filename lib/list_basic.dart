import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/models/destination.dart';
import 'package:flutter_fieldsheet/models/odour.dart';
import 'package:flutter_fieldsheet/services/database.dart';
import 'package:provider/provider.dart';

class ListBasic extends StatelessWidget {
  final Destination destination;
  final List<String> searchUID;

  const ListBasic({Key key, this.destination, this.searchUID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String activeLBUID;
    //activeLBUID = searchUID;
    //print('this is ListBasic $activeLBUID');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SearchTextForm(),
              OdourListWidget(
                searched: ['null'],
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

class OdourListWidget extends StatefulWidget {
  final List<String> searched;

  final String searchText;

  const OdourListWidget({Key key, this.searched, this.searchText})
      : super(key: key);

  @override
  _OdourListWidgetState createState() => _OdourListWidgetState();
}

class _OdourListWidgetState extends State<OdourListWidget> {
  String activeUID;
  List<String> activeSearched;

  @override
  void initState() {
    activeSearched = widget.searched;
    super.initState();
  }

  void filterList(String searchText) {
    activeSearched.clear();
    setState(() {
      activeSearched.add(searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<Database>(context);

    // List<String> quickUID = ['1000', '1005', '1010'];

    return Material(
      child: StreamBuilder<List<Odour>>(
          stream: activeSearched[0] == 'null'
              ? db.odoursStream()
              : db.filterOdourStream(searchUID: activeSearched),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var odour = snapshot.data;
              return GestureDetector(
                onLongPress: () {
                  setState(() {
                    activeUID = 'null';
                  });
                },
                child: Center(
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.75,
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
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: ListTile(
                                      title: Text('${odour[count].reference}'),
                                      leading: Text('${odour[count].uid}',
                                        style: TextStyle(fontSize: 19,
                                            color: Colors.deepOrange),),
                                      subtitle: Text('${odour[count].site}'),
                                      trailing: Text('${odour[count].bag3}'),
                                      // style: TextStyle(fontSize: 13, color: Colors.black),),
                                      onTap: () {
                                        print(
                                            'WHAT JUST HAPPENED: $count with ${odour[count]
                                                .uid}');
                                        setState(() {
                                          activeUID = '${odour[count].uid}';
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 2)
                                ],
                              )),
                    ),
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

class SearchTextForm extends StatefulWidget {

  @override
  _SearchTextFormState createState() => _SearchTextFormState();
}

class _SearchTextFormState extends State<SearchTextForm> {

  TextEditingController searchUIDTEC = TextEditingController();

  @override
  void dispose() {
    searchUIDTEC.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(flex: 3,
            child: SizedBox(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Search'),
                controller: searchUIDTEC,

              ),
            ),
          ),
          Expanded(flex: 1,
              child: RaisedButton(
                onPressed: () => OdourListWidget(searchText: searchUIDTEC.text)

                ,
                child: Icon(Icons.search),))
        ],

      ),
    );
  }
}