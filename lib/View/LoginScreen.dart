import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample/View/HomeScreen.dart';
import 'package:sample/constants.dart';
import '../Model/loginModel.dart';
import '../Service/service.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String userName;
  late String passWord;
  @override
  // void initState() {
  //   super.initState();
  //   loginDetail = fetchLoginData();
  // }
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Stack(
                  children: [
                    Image.asset(restuarantImage,
                      height: totalHeight * 0.40,
                      width: totalWidth,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: totalHeight * 0.40,
                      width: totalWidth,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white
                              ])
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                      appName,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)
                  ),
                ),
                Center(
                  child: Text(
                      slogan,
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Container(
                      child: Text(login, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.blueAccent.withOpacity(0.6),
                                Colors.transparent
                              ]),
                          border: Border(left: BorderSide(color: Colors.blueAccent, width: 5))
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Please enter Email";
                      } else {
                        userName = email;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.blueAccent,),
                        labelText: emailAddress,
                        labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 16)
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Please enter password";
                      } else {
                        passWord = password;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open, color: Colors.blueAccent,),
                        labelText: password,
                        labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 16)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(onPressed: () {},
                          child: (Text(forgetPassword)))
                  ),
                ),
                Center(
                    child: FlatButton(onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        LoginDetail? loginDetail = await fetchLoginData(userName, passWord);
                       if (loginDetail != null && loginDetail.ID == '1') {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),
                       ),
                       );
                       } else {
                         Text('Wrong Password',
                           style: TextStyle(color: Colors.redAccent),);
                       }
                      } else {
                        print("Not Valid");
                      }
                    },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        color: Colors.blueAccent,
                        child: (Text(loginWithAccount,style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold) )))
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dontHaveAcc),
                    FlatButton(onPressed: () {},
                        child: Text(createAccount, style: TextStyle(color: Colors.blueAccent),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

