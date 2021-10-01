import 'package:flutter/material.dart';
import 'package:sample/constants.dart';
import 'signupscreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  final bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Column(children: [
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        width: 210,
                        child: Image.asset(illustration),
                      )),
                ),
                Text(
                  welcomeTxt,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      fontFamily: 'Ubuntu'),
                ),
                SizedBox(height: 7),
                Text(loginIntoTxt,
                    style: TextStyle(
                        color: Colors.grey[500], fontFamily: 'Ubuntu')),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: TextFormField(
                      controller: email,
                      style: TextStyle(
                          color: Colors.blue[600], fontWeight: FontWeight.w600),
                      decoration: new InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey[500],
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.grey[500], fontFamily: 'Ubuntu'),
                          hintText: hintTxtEmail,
                          fillColor: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 12,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: TextFormField(
                      obscureText: true,
                      controller: password,
                      style: TextStyle(
                          color: Colors.blue[600], fontWeight: FontWeight.w600),
                      decoration: new InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              Icons.lock_open_rounded,
                              color: Colors.grey[500],
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(50.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                              color: Colors.grey[500], fontFamily: 'Ubuntu'),
                          hintText: hintTxtPwd,
                          fillColor: Colors.white),
                    ),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 12,
                        offset: const Offset(2, 2),
                      )
                    ]),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          forgotPwdTxt,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Ubuntu'),
                        )),
                  ),
                  onTap: () {
                    print("I forgot my password!");
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  child: Container(
                    width: 160,
                    height: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        loginTxt,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'Ubuntu'),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 12,
                            offset: const Offset(2, 2),
                          ),
                        ]),
                  ),
                  onTap: () {
                    print("Loggin in...");
                  },
                ),
                // SizedBox(height: 50),
                // Text(
                //   "Or connect using",
                //   style:
                //       TextStyle(color: Colors.grey[400], fontFamily: 'Ubuntu'),
                // ),
                // SizedBox(height: 20),
                // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //   Container(
                //       width: 140,
                //       height: 50,
                //       decoration: BoxDecoration(
                //         color: Colors.blue[900],
                //         borderRadius: BorderRadius.all(Radius.circular(7)),
                //         // boxShadow: [
                //         //   BoxShadow(
                //         //     color: Colors.grey[400],
                //         //     blurRadius: 12,
                //         //     offset: const Offset(2, 2),
                //         //   ),
                //         // ]
                //       ),
                //       child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             // SizedBox(width: 15),
                //             Text("f",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25,
                //                 )),
                //             SizedBox(width: 10),
                //             Text("Facebook",
                //                 style: TextStyle(
                //                     letterSpacing: 1,
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.w600,
                //                     fontFamily: 'Ubuntu')),
                //           ])),
                //   SizedBox(width: 30),
                //   Container(
                //       width: 140,
                //       height: 50,
                //       decoration: BoxDecoration(
                //         color: Colors.deepOrange[800],
                //         borderRadius: BorderRadius.all(Radius.circular(7)),
                //         // boxShadow: [
                //         //   BoxShadow(
                //         //     color: Colors.grey[400],
                //         //     blurRadius: 12,
                //         //     offset: const Offset(2, 2),
                //         //   ),
                //         // ]
                //       ),
                //       child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             SizedBox(width: 10),
                //             Text("G",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25,
                //                 )),
                //             SizedBox(width: 10),
                //             Text("Google",
                //                 style: TextStyle(
                //                     letterSpacing: 1,
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.w600,
                //                     fontFamily: 'Ubuntu')),
                //           ]))
                // ]),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dontHaveAccTxt,
                      style: TextStyle(fontFamily: 'Ubuntu'),
                    ),
                    SizedBox(width: 7),
                    InkWell(
                      child: Text(signUpIntoTxt,
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                    )
                  ],
                ),
                SizedBox(height: 50)
              ])
            ],
          )),
    );
  }
}
