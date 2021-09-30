import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample/Model/loginModel.dart';


Future<LoginDetail?> fetchLoginData(String userName, pass) async {

  final response = await http.get(
      Uri.parse('http://application.maths12.com/api/Registration/GetAllUsers?userInput=$userName&password=$pass'));
  if (response.statusCode == 200) {
    final jsonresponse = json.decode(response.body);
    var loginDetails = LoginList.fromJson(jsonresponse);
    if (loginDetails.loginsDetail.length > 0) {
      return loginDetails.loginsDetail[0];
    } else {
      return null;
    }
  } else {
    throw Exception("Failed to load");
  }
}