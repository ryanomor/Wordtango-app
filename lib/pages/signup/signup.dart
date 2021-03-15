import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wordtango/widgets/phoneAuth/phoneAuth.dart';
import 'package:wordtango/pages/signup/components/body.dart';

class SignUp extends StatelessWidget {
  final bool isPhoneAuth;
  final UserCredential newUser;
  const SignUp({Key key, this.isPhoneAuth, this.newUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isPhoneAuth != null && isPhoneAuth
        ? SignUpBody(newUser: newUser)
        : PhoneAuthentication(
            flow: 'signup',
          );
  }
}
