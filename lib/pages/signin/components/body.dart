import 'package:flutter/material.dart';
import 'package:wordtango/widgets/background.dart';
import 'package:wordtango/widgets/phoneAuth/phoneAuth.dart';
import 'package:wordtango/pages/signin/components/roundedIconButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInBody extends StatelessWidget {
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String email;
  String password;

  Container _inputTextField({
    String hintText,
    bool obscureText,
    TextEditingController controller,
  }) {
    return Container(
      height: 56,
      padding: EdgeInsets.fromLTRB(16.0, 3, 16, 6),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(5, 3.5),
            blurRadius: 3.0,
          ),
          // BoxShadow(
          //   color: Colors.white,
          //   offset: Offset(-5, -2),
          //   blurRadius: 3.0,
          // )
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          // focusColor: Theme.of(context).accentColor,
          hintText: hintText,
          border: InputBorder.none,
        ),
        onChanged: (val) {
          // controller.text = val;
          // print('new value: ${controller.text}');
        },
      ),
    );
  }

  void handleSocialMediaLogin({IconData icon, BuildContext context}) {
    if (icon == FontAwesomeIcons.line) {
      print('login with LINE');
    } else if (icon == FontAwesomeIcons.weixin) {
      print('login with WeChat');
    } else if (icon == FontAwesomeIcons.qq) {
      print('login with QQ');
    } else if (icon == FontAwesomeIcons.solidComment) {
      print('login with phone number');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PhoneAuthentication()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      stack: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/logos/longWhite.png'),
                // RoundedIconButton(
                //   size: size,
                //   icon: FontAwesomeIcons.qq,
                //   text: 'SIGN IN WITH QQ',
                //   onPressed: handleSocialMediaLogin,
                // ),
                RoundedIconButton(
                  size: size,
                  icon: FontAwesomeIcons.line,
                  text: 'SIGN IN WITH LINE',
                  onPressed: handleSocialMediaLogin,
                ),
                RoundedIconButton(
                  size: size,
                  icon: FontAwesomeIcons.weixin,
                  text: 'SIGN IN WITH WECHAT',
                  onPressed: handleSocialMediaLogin,
                ),
                RoundedIconButton(
                  size: size,
                  icon: FontAwesomeIcons.solidComment,
                  text: 'SIGN IN WITH PHONE NUMBER',
                  onPressed: handleSocialMediaLogin,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 30, top: 10),
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
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
