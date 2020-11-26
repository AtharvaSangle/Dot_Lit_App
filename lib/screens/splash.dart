import 'package:demoapp/widgets/form_fields.dart';
import 'package:demoapp/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

String userEmail, password;

class _SplashState extends State<Splash> {
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailCntrl = TextEditingController();
  final passwordCntrl = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/dotlitlogonew1.png',
                height: 125.0,
              ),
              addVerticalSpacing(20.0),
              Text(
                'Media made easy',
                style: TextStyle(
                    fontSize: 31.0,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w600),
              ),
              addVerticalSpacing(25.0),
              SigningButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0))),
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 45.0, horizontal: 15.0),
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Center(
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: emailCntrl,
                                      autofocus: true,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey[400],
                                            width: 1.0,
                                          ),
                                        ),
                                        labelText: 'Email',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                      ),
                                      onChanged: (value) {
                                        userEmail = value;
                                      },
                                    ),
                                    addVerticalSpacing(15.0),
                                    TextField(
                                      controller: passwordCntrl,
                                      obscureText: hidePassword,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey[400],
                                            width: 1.0,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          splashRadius: 15.0,
                                          color: hidePassword
                                              ? Colors.lightBlue[300]
                                              : Colors.grey[500],
                                          onPressed: () {
                                            setState(() {
                                              hidePassword = !hidePassword;
                                            });
                                          },
                                        ),
                                        labelText: 'Password',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                      ),
                                      onChanged: (value) {
                                        password = value;
                                      },
                                    ),
                                    addVerticalSpacing(25.0),
                                    ActionButton(
                                      label: 'Login',
                                      color: Colors.red[300],
                                      onPressed: () async {
                                        try {
                                          final user = await auth
                                              .signInWithEmailAndPassword(
                                                  email: userEmail,
                                                  password: password);
                                          print(user);
                                          if (user != null) {
                                            setState(() {
                                              passwordCntrl.clear();
                                              emailCntrl.clear();
                                              userEmail = null;
                                              password = null;
                                            });
                                            Navigator.pushNamed(
                                                context, '/home');
                                          }
                                        } catch (e) {
                                          print(e.message);
                                          print(e.code);
                                          if (e.code == 'wrong-password') {
                                            password = password;
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                prefix_icon: FaIcon(FontAwesomeIcons.envelope),
                label: 'Sign in with email',
                color: Colors.grey[800],
              ),
              addVerticalSpacing(10),
              SigningButton(
                onPressed: () {},
                prefix_icon: FaIcon(FontAwesomeIcons.facebook),
                label: 'Sign in with facebook',
                color: Color(0xff465898),
              ),
              addVerticalSpacing(35.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account, ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.red[400],
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SigningButton extends StatelessWidget {
  Function onPressed;
  Color color;
  var prefix_icon;
  String label;

  SigningButton(
      {this.label, this.color, this.prefix_icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(70.0)),
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: prefix_icon,
              onPressed: () {},
              iconSize: 20.0,
              padding: EdgeInsets.all(0),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
