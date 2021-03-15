import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordtango/pages/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wordtango/pages/signup/signup.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wordtango/widgets/phoneAuth/components/roundedGradientButton.dart';

// One-Time Pin Widget
class OTP extends StatefulWidget {
  final String flow;
  final String number;
  final String countryCode;

  OTP({Key key, this.flow, @required this.countryCode, @required this.number})
      : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String _errorMsg = '';
  String _verificationCode;
  String number;

  // PhoneAuthCredential phoneAuthCredential;
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController _pinController = TextEditingController();
  TextEditingController _buttonController = TextEditingController();

  bool _showResend = false;
  bool _canValidate = false;
  bool _calledValidatePin = false;

  @override
  void initState() {
    super.initState();
    // auth.setLanguageCode(widget.countryCode.replaceAll('+', ''));
    number = '${widget.countryCode}${widget.number}';
    verifyPhoneNumber();
    Timer(Duration(seconds: 3), () {
      _showResend = true;
    });
  }

  Future<void> verifyPhoneNumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        print('in android verification method');
        if (widget.flow != null && widget.flow.toLowerCase() == 'signup') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignUp(isPhoneAuth: true)),
            (route) => false,
          );
        } else {
          // Sign the user in with the auto-generated credential
          await auth.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => App()),
                (route) => false,
              );
            }
          });
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _errorMsg = 'Invalid pin';
        });
        print('Auth exception: ${e.message}');
      },
      codeSent: (String verificationId, int resendToken) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void validatePin(BuildContext context, String pin) async {
    setState(() {
      _calledValidatePin = true;
      _canValidate = pin.length == 6;
    });

    if (_canValidate) {
      print('proceed to validate pin');
      try {
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: _verificationCode,
          smsCode: pin,
        );

        await auth.signInWithCredential(phoneAuthCredential).then((res) async {
          if (widget.flow?.toLowerCase() == 'signup' &&
              res.additionalUserInfo.isNewUser) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp(isPhoneAuth: true, newUser: res),
              ),
              (route) => false,
            );
          } else if (res.user != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => App()),
              (route) => false,
            );
          }
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMsg = 'Invalid pin';
        });
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    } else {
      print('can\'t validate pin yet...');
    }
  }

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
                        number, //widget.number.replaceAll('+', ''),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[400],
                        ),
                      ),
                      TextButton(
                        child: Text(
                          _showResend ? 'Resend' : '',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        onPressed: verifyPhoneNumber,
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
                      selectedColor: Theme.of(context).accentColor,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    errorTextSpace: 30,
                    validator: (value) {
                      _canValidate = _calledValidatePin && value.length == 6;
                      if (_calledValidatePin && value.length != 6) {
                        _errorMsg = 'missing ${6 - value.length} digits';
                        return _errorMsg;
                      } else if (_calledValidatePin && _errorMsg.isNotEmpty) {
                        return _errorMsg;
                      }
                      return null;
                      // return ()
                      //     ? 'missing ${6 - value.length} digits'
                      //     : null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _buttonController.text = value;
                      });
                    },
                    onSubmitted: (value) {
                      validatePin(context, value);
                    },
                    onCompleted: (value) {
                      validatePin(context, value);
                    },
                  ),
                ],
              ),
              RoundedGradientButton(
                controller:
                    _canValidate ? _buttonController : TextEditingController(),
                onPressed: () {
                  validatePin(context, _pinController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
