import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Size size;
  final Function onPressed;

  RoundedIconButton(
      {Key key,
      @required this.text,
      @required this.icon,
      @required this.size,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        child: FlatButton(
          color: Colors.transparent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.white, width: 2.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          onPressed: () => onPressed(icon: icon, context: context),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
