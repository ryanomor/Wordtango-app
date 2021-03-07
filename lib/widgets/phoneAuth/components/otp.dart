import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wordtango/widgets/phoneAuth/components/roundedGradientButton.dart';

// One-Time Pin Widget
class OTP extends StatefulWidget {
  final String number;

  OTP({Key key, @required this.number}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.grey[400],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My code:",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.number.replaceAll('+', ''),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[400],
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          print('resend verification text');
                        },
                      ),
                    ],
                  ),
                  PinCodeTextField(
                    length: 6,
                    autoFocus: true,
                    appContext: context,
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    backgroundColor: Colors.transparent,
                    pinTheme: PinTheme(
                        inactiveColor: Colors.grey[400],
                        activeColor: Theme.of(context).primaryColor,
                        selectedColor: Theme.of(context).accentColor),
                    onChanged: (value) {
                      print('input: $value');
                    },
                  ),
                ],
              ),
              RoundedGradientButton(
                controller: _pinController,
                onPressed: () {
                  print('validate pin...');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
