import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample/HomeScreen.dart';
import 'package:sample/constants.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class LoginList {
  final List<LoginDetail> loginsDetail;

  LoginList({
    required this.loginsDetail,
  });

  factory LoginList.fromJson(List<dynamic> parsedJson) {
    List<LoginDetail> loginsDetail = <LoginDetail>[];
    loginsDetail = parsedJson.map((i)=>LoginDetail.fromJson(i)).toList();
    return new LoginList(
      loginsDetail: loginsDetail,
    );
  }
}
class LoginDetail {
  final String Email;
  final String ID;
  final String Name;
  final String Password;

  LoginDetail(
      {required this.Email, required this.ID, required this.Name, required this.Password});

  factory LoginDetail.fromJson(Map<String, dynamic> jsonResponse) {
    return new LoginDetail(
      Email: jsonResponse['Email'],
      ID: jsonResponse['ID'].toString(),
      Name: jsonResponse['Name'],
      Password: jsonResponse['Password'],
    );
  }
}
Future<LoginDetail> fetchLoginData() async {

  final response = await http.get(
      Uri.parse('http://application.maths12.com/api/Registration/GetAllUsers?userInput=testuser@gmail.com&password=12345'));
  if (response.statusCode == 200) {
    final jsonresponse = json.decode(response.body);
    var loginDetails = LoginList.fromJson(jsonresponse); //json.decode(response.body);
    print(loginDetails.loginsDetail[0].Name);
    return loginDetails.loginsDetail[0];
  } else {
    throw Exception("Failed to load");
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Future<LoginDetail> loginDetail;

  @override
  void initState() {
    super.initState();
    loginDetail = fetchLoginData();
  }
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
                    child: FlatButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print("Valid");
                        FocusScope.of(context).unfocus();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),
                        ),
                        );
                   //     late Future<LoginDetail> loginDetail = fetchLoginData();
                   //      FutureBuilder<LoginDetail>(
                   //        future: loginDetail,
                   //        builder: (context, snapshot) {
                   //          if (snapshot.hasData) {
                   //            if (snapshot.data!.ID == '1') {
                   //              var email = snapshot.data!.Email;
                   //              print("Valid Email: $email");
                   //              FocusScope.of(context).unfocus();
                   //              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),
                   //              ),
                   //              );
                   //            } else {
                   //              return Text("Login Failed...");
                   //            }
                   //          } else if (snapshot.hasError) {
                   //            return Text('${snapshot.error}');
                   //          }
                   //          // By default, show a loading spinner.
                   //          return const CircularProgressIndicator();
                   //        },
                   //      );
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

