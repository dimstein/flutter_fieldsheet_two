import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/LayoutScreen/layout_basic.dart';
import 'package:flutter_fieldsheet/list_basic.dart';
import 'package:flutter_fieldsheet/text_basic.dart';

class Destination {
  const Destination(
      {this.index,
      this.title,
      this.icon,
      this.color,
      this.page,
      this.pageTitle});

  final String title;
  final IconData icon;
  final MaterialColor color;
  final int index;
  final Widget page;
  final String pageTitle;
}

const List<Destination> allDestinations = <Destination>[
  Destination(
      index: 0,
      title: 'Entry',
      icon: Icons.home,
      color: Colors.red,
      page: LayoutBasic(),
      pageTitle: 'Layout Basic'),
  Destination(
      index: 1,
      title: 'List',
      icon: Icons.business,
      color: Colors.cyan,
      page: ListBasic(),
      pageTitle: 'List Basic'),
  Destination(
      index: 2,
      title: "Simple",
      icon: Icons.first_page,
      color: Colors.lime,
      page: TextBasic(),
      pageTitle: 'Text Basic'),
];

class ViewNavigatorObserver extends NavigatorObserver {
  final VoidCallback onNavigation;

  ViewNavigatorObserver(this.onNavigation);

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoutes) {
    onNavigation();
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination, this.onNavigation})
      : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime[200],
      child: IndexedStack(
        sizing: StackFit.expand,
        index: widget.destination.index,
        children: [TextBasic(), ListBasic(), LayoutBasic()],
      ),
    );

    // return Navigator(
    //         observers: <NavigatorObserver>[
    //     ViewNavigatorObserver(widget.onNavigation),
    //   ],
    //    onGenerateRoute: (RouteSettings settings) {
    //     return MaterialPageRoute(
    //       settings: settings,
    //       builder: (BuildContext context) {
    //         switch (settings.name) {
    //           case '/':
    //             return TextBasic(destination: widget.destination);
    //           case '/list':
    //             return ListBasic(destination:  widget.destination);
    //           case '/entry' :
    //             return LayoutBasic(destination: widget.destination);
    //         } return Center(child: Container(child: CircularProgressIndicator()));
    //       },
    //     );
    //   },
    // );
  }
}
