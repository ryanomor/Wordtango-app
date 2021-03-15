import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wordtango/widgets/background.dart';
import 'package:wordtango/pages/welcome/welcome.dart';
import 'package:wordtango/widgets/phoneAuth/phoneAuth.dart';
import 'package:fluwx/fluwx.dart' as WeChatSDK;
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:wordtango/pages/signin/components/roundedIconButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpBody extends StatefulWidget {
  final UserCredential newUser;

  const SignUpBody({Key key, @required this.newUser}) : super(key: key);

  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  LineSDK _lineSDK = LineSDK.instance;

  void handleSocialMediaSignUp({IconData icon, BuildContext context}) async {
    // widget.newUser.user.linkWithCredential()
    if (icon == FontAwesomeIcons.line) {
      print('sign up with LINE');
      try {
        await _lineSDK
            .login(
              scopes: ["profile", "openid", "email"],
            )
            .then(_onLoginSuccess)
            .catchError(_onLoginError);
      } catch (e) {
        print('error signing into LINE: $e');
      }
    } else if (icon == FontAwesomeIcons.weixin) {
      print('sign up with WeChat');
      if (await WeChatSDK.isWeChatInstalled) {
        WeChatSDK.sendWeChatAuth(scope: 'snsapi_userinfo');
      } else {
        // WeChatSDK.authWeChatByQRCode(appId: env['WECHAT_APP_ID']);
      }
    } else if (icon == FontAwesomeIcons.envelope) {
      print('sign up with email');
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Email));
      // widget.newUser.user.verifyBeforeUpdateEmail();
    }
  }

  void _onLoginSuccess(LoginResult data) {
    print('LoginSuccess: ${data.userProfile.data}');
    print('Access Token: ${data.data}');
    print('ID Token: ${data.accessToken.data["id_token"]}');
    // print('ID Token: ${data.data["accessToken"]["id_token"]}');
    print(
        'email: ${JwtDecoder.decode(data.data["accessToken"]["id_token"])["email"]}');
  }

  void _onLoginError(Object error) {
    print('LoginError: $error');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      stack: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  widget.newUser.user.delete();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                    (route) => false,
                  );
                },
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logos/longWhite.png'),
                  RoundedIconButton(
                    icon: FontAwesomeIcons.line,
                    size: size,
                    text: 'SIGN UP WITH LINE',
                    onPressed: handleSocialMediaSignUp,
                  ),
                  RoundedIconButton(
                    icon: FontAwesomeIcons.weixin,
                    size: size,
                    text: 'SIGN UP WITH WECHAT',
                    onPressed: handleSocialMediaSignUp,
                  ),
                  RoundedIconButton(
                    icon:
                        Icons.email_outlined, // FontAwesomeIcons.solidEnvelope,
                    size: size,
                    text: 'SIGN UP WITH EMAIL',
                    onPressed: handleSocialMediaSignUp,
                  ),
                  // Text(
                  //   'Create Your Profile',
                  // ),
                  // Text('1 of 3'),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 10),
                  //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  //   alignment: Alignment.center,
                  //   width: size.width * 0.8,
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).accentColor,
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: Text(
                  //       'Sign up flow for uid: ${widget.newUser.user.uid}'),
                  // ),
                  Container(
                    width: size.width * 0.8,
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      'By signing up you consent to allow the app to obtain your email to create an account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   child: Image.asset(
          //     'assets/illustrations/signup_woman.png',
          //   ),
          //   width: size.width * 0.35,
          //   left: 5,
          //   top: size.height / 2,
          // ),
          // Positioned(
          //   child: Image.asset(
          //     'assets/illustrations/signup_man.png',
          //   ),
          //   width: size.width * 0.35,
          //   right: 5,
          //   bottom: 75,
          // ),
        ],
      ),
    );
    // Container(
    //   height: size.height,
    //   width: double.infinity,
    //   child:
    // );
  }
}
