import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:to_do/widgets/beng_divider.dart';
import 'package:to_do/widgets/sign_in_icon_button.dart';
import 'package:to_do/pages/sign_up_page.dart';
import 'package:to_do/services/auth.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),

        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Text(
                        'T O',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                      Text(
                        'D O',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10,
                      vertical: 0,
                    ),

                    child: Form(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'email',
                            ),
                          ),


                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'password',
                            ),
                          ),


                          SizedBox(
                            height: 5,
                          ),


                          Container(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Text(
                                'Forgot your password?',
                                style: TextStyle(
                                    color: Colors.black.withAlpha(160)
                                ),
                              ),

                              onTap: () {},
                            ),
                          ),


                          SizedBox(
                            height: 20,
                          ),


                          SizedBox(
                            width: MediaQuery.of(context).size.width * 3 / 5,
                            child: RaisedButton(
                              color: Colors.orangeAccent,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              onPressed: () {},
                            ),
                          ),


                          SizedBox(
                            height: 5,
                          ),


                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Don\'t have any account?',
                                style: TextStyle(
                                    color: Colors.black.withAlpha(160)
                                ),
                              ),


                              SizedBox(
                                width: 5,
                              ),


                              InkWell(
                                child: Text(
                                  'Sign Up',
                                ),

                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return SignUpPage();
                                      }
                                    )
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),


                  Column(
                    children: [
                      BengDivider(
                        text: 'OR',
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 3
                        ),
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SignInIconButton(
                            icon: MdiIcons.google,
                            iconColor: Colors.white,
                            buttonColor: Colors.redAccent,
                            onPressed: () async {
                              User user = await auth.signInWithGoogle();
                              print(user.email);
                            },
                          ),


                          SignInIconButton(
                            icon: MdiIcons.facebook,
                            iconColor: Colors.indigo,
                            onPressed: () {
                              auth.signOut();
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
