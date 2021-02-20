import 'package:flutter/material.dart';

class AppNav extends StatefulWidget {
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final List<IconData> icons;

  AppNav({@required this.icons});

  @override
  _AppNavState createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          for (var i = 0; i < widget.icons.length; i++)
            Icon(
              widget.icons[i],
            )
        ],
      ),
    );
  }
}
