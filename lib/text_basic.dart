import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/models/destination.dart';
import 'package:flutter_fieldsheet/models/odour.dart';
import 'package:flutter_fieldsheet/services/database.dart';
import 'package:provider/provider.dart';

class TextBasic extends StatelessWidget {
  final Destination destination;

  const TextBasic({Key key, this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = Provider.of<Database>(context);
    // List<Odour> dummy;
    return Material(
      child: StreamBuilder<List<Odour>>(
          // initialData: dummy, //can be optional
          stream: db.odourStream(odourUID: '1003'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == null) {
              return Container(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('THIS HAS PRODUCED AN ERROR IN THE STREAMBUILDER');
            }
            if (snapshot.hasData) {
              var odour = snapshot.data.last;
              return Center(
                child: Container(
                    color: Colors.lime[300],
                    child: ListTile(
                      title: Text('${odour.site}'),
                      subtitle: Text('${odour.client}'),
                      leading: Text(
                        '${odour.uid}',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      trailing: Text(
                        odour.bag1,
                        style: TextStyle(fontSize: 12, color: Colors.indigo),
                      ),
                    )),
              );
            }
            return Container(child: CircularProgressIndicator());
          }),
    );
  }
}


