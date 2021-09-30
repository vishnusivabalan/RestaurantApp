


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