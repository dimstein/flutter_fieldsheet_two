import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/models/odour.dart';
import 'package:flutter_fieldsheet/services/database.dart';
import 'package:provider/provider.dart';

class TextBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = Provider.of<Database>(context);
    List<Odour> dummy;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Whats Up'),
        ),
        body: StreamBuilder<List<Odour>>(
            initialData: dummy, //can be optional
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
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.lime[300],
                      child: ListTile(
                        title: Text('${odour.site}'),
                        subtitle: Text('${odour.client}'),
                        leading: Text('${odour.uid}'),
                        trailing: Text(odour.bag1),
                      )),
                );
              }
              return Container(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}


