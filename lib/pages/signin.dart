import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
          focusColor: Theme.of(context).accentColor,
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

  Widget _socialMediaLogin({IconData icon, Color color}) {
    return icon == FontAwesomeIcons.line
        ? Material(
            elevation: 16.0,
            color: Colors.transparent,
            shadowColor: Colors.black26,
            borderRadius: BorderRadius.circular(18.0),
            child: InkWell(
                splashColor: Colors.white30,
                onTap: () {
                  handleSocialMediaLogin(icon);
                },
                child: Container(
                  width: 45.0,
                  height: 50.0,
                  color: Colors.white,
                  child: Icon(
                    icon,
                    color: color,
                    size: 54,
                  ),
                )),
          )
        : SizedBox.fromSize(
            size: Size(54, 54),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Material(
                elevation: 16.0,
                shadowColor: Colors.black26,
                color: color,
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () {
                    handleSocialMediaLogin(icon);
                  },
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
          );
  }

  handleSocialMediaLogin(IconData icon) {
    if (icon == FontAwesomeIcons.line) {
      print('login with LINE');
    } else if (icon == FontAwesomeIcons.weixin) {
      print('login with WeChat');
    } else if (icon == FontAwesomeIcons.qq) {
      print('login with QQ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/illustrations/Asset 21.png'),
            alignment: Alignment.bottomLeft,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.blueAccent[400],
              Theme.of(context).primaryColor,
              Colors.red[400],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/longWhite.png'),
            // SizedBox(
            //   height: 70,
            // ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _inputTextField(
                      obscureText: false,
                      hintText: 'example@email.com',
                      controller: emailController,
                    ),
                    _inputTextField(
                      obscureText: true,
                      hintText: 'password',
                      controller: pwdController,
                    ),
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
                          print('new email: ${emailController.text}');
                          print('new pwd: ${pwdController.text}');
                          emailController.clear();
                          pwdController.clear();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '–––––––––––',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white54,
                          ),
                        ),
                        // Divider(
                        //   color: Colors.white,
                        //   thickness: 5.0,
                        // ),
                        Text(
                          '   OR   ',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white54,
                          ),
                        ),
                        Text(
                          '–––––––––––',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _socialMediaLogin(
                          icon: FontAwesomeIcons.line,
                          color: Color(0xff00b900),
                        ),
                        _socialMediaLogin(
                          icon: FontAwesomeIcons.weixin,
                          color: Color(0xff7bb32E),
                        ),
                        _socialMediaLogin(
                          icon: FontAwesomeIcons.qq,
                          color: Color(0xff3e7bd1),
                        ),
                      ],
                    ),

                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.blueAccent),
                    //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    //     ),
                    //     labelText: "Email",
                    //     labelStyle: TextStyle(fontSize: 15.0),
                    //     hintText: "example@email.com",
                    //   ),
                    //   // autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   // validator: (value) {},
                    //   onSaved: (newValue) => email = newValue,
                    // ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     border: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Colors.blueAccent, width: 5.0),
                    //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    //     ),
                    //     // labelText: "Password",
                    //     labelStyle: TextStyle(fontSize: 15.0),
                    //     hintText: "password",
                    //   ),
                    //   // autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   // validator: (value) {},
                    //   onSaved: (newValue) => email = newValue,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
      // persistentFooterButtons: [
      //   Container(
      //     height: 60.0,
      //     // color: Colors.transparent,
      //     margin: EdgeInsets.only(left: 8.0),
      //     child: Align(
      //       child: InkWell(
      //         onTap: () {
      //           print('Sign up');
      //         },
      //         child: Text(
      //           'Don\'t have an account? Sign up',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 14.0,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
