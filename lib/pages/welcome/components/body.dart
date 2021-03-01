import 'package:flutter/material.dart';
import 'package:wordtango/widgets/background.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // provides the total height & width of user's screen
    Size size = MediaQuery.of(context).size;

    return Background(
      stack: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/illustrations/Asset 21.png',
            ),
            width: size.width * 1.2,
            bottom: -45,
            left: -45,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logos/longWhite.png'),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlatButton(
                  color: Colors.white,
                  splashColor: Theme.of(context).primaryColor,
                  minWidth: size.width * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  onPressed: () {
                    print('Navigate to signup widget');
                  },
                  child: Text('CREATE ACCOUNT'),
                ),
              ),
              ClipRRect(
                child: FlatButton(
                  color: Colors.white10,
                  textColor: Colors.white,
                  minWidth: size.width * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  onPressed: () {
                    print('Navigate to login widget');
                  },
                  child: Text('SIGN IN'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  child: Column(
                    children: [
                      // _inputTextField(
                      //   obscureText: false,
                      //   hintText: 'example@email.com',
                      //   controller: emailController,
                      // ),
                      // _inputTextField(
                      //   obscureText: true,
                      //   hintText: 'password',
                      //   controller: pwdController,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.0),
                            child: Align(
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 46,
                        width: 100,
                        padding: EdgeInsets.only(top: 12.0),
                        child: RaisedButton(
                          onPressed: () {
                            // print('new email: ${emailController.text}');
                            // print('new pwd: ${pwdController.text}');
                            // emailController.clear();
                            // pwdController.clear();
                          },
                          textColor: Colors.white,
                          color: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
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
