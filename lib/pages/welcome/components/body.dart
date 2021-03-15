import 'package:flutter/material.dart';
import 'package:wordtango/widgets/background.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wordtango/pages/signin/signin.dart';
import 'package:wordtango/pages/signup/signup.dart';
import 'package:fluwx/fluwx.dart' as WeChatSDK;
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key key}) : super(key: key);

  @override
  _WelcomeBodyState createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  @override
  void initState() {
    super.initState();
    // initialize sdks
    LineSDK.instance.setup(env['LINE_CHANNEL_ID']).then((_) {
      print('LineSDK Prepared');
    });
    WeChatSDK.registerWxApi(
      appId: env['WECHAT_APP_ID'],
      universalLink: env['UNIVERSAL_LINK'],
    ).then(
      (isRegistered) {
        print('WeChat is initialized: $isRegistered');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // provides the total height & width of user's screen
    Size size = MediaQuery.of(context).size;

    return Background(
      stack: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/illustrations/welcome_chat.png',
            ),
            width: size.width * 1.2,
            bottom: -85,
            left: -45,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logos/longWhite.png'),
              Container(
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FlatButton(
                    color: Colors.white,
                    splashColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text('CREATE ACCOUNT'),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.8,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: ClipRRect(
                  child: FlatButton(
                    color: Colors.transparent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                    child: Text('SIGN IN'),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 10.0),
                child: Align(
                  child: TextButton(
                    onPressed: () {
                      print('Navigate to code verify page');
                    },
                    child: Text(
                      'Need help signing in?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
