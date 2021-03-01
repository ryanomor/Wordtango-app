import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Stack stack;
  final MainAxisAlignment mainAxisAlignment;

  const Background({
    Key key,
    @required this.stack,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // provides the total height & width of user's screen
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor,
            Colors.red[400],
          ],
        ),
      ),
      child: stack,
    );
  }
}
