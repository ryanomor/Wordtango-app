import 'package:flutter/material.dart';

class RoundedGradientButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final TextEditingController controller;

  const RoundedGradientButton({
    Key key,
    this.text,
    @required this.onPressed,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: controller.text.isEmpty ? Colors.grey[200] : null,
        gradient: controller.text.isNotEmpty
            ? LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Theme.of(context).accentColor,
                  Theme.of(context).primaryColor,
                  Colors.red[400],
                ],
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500],
            offset: Offset(0.0, 1.5),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: controller.text.isNotEmpty
              ? onPressed
              : () {
                  print('please enter a valid number first');
                },
          child: Center(
            child: Text(
              text == null ? 'CONTINUE' : text,
              style: TextStyle(
                  color: controller.text.isEmpty ? Colors.black : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
