
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sample/constants.dart';
import 'package:xml2json/xml2json.dart';

Future<Covid> fetchData() async {
  final response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries/india'));
  if (response.statusCode == 200) {
    return Covid.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load");
  }
}

class WebService extends StatefulWidget {
  const WebService({Key? key}) : super(key: key);

  @override
  _WebServiceState createState() => _WebServiceState();
}

class _WebServiceState extends State<WebService> {
  late Future<Covid> futureCovid;
  initState() {
    futureCovid = fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Covid>(
        future: futureCovid,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(pizzaImg),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Row(
                      children: [
                        Text("Cases : ",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 30,
                        ),
                        ),
                        SizedBox(width: 20,),
                        Text(snapshot.data!.cases.toString(),
                        style: TextStyle(
                          fontSize: 25,
                        ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Row(
                      children: [
                        Text("Death : ",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(snapshot.data!.deaths.toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Row(
                      children: [
                        Text("Recovered : ",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(snapshot.data!.recovered.toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Row(
                      children: [
                        Text("Active : ",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(snapshot.data!.active.toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Row(
                      children: [
                        Text("Updated : ",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(snapshot.data!.updated.toString(),
                          style: TextStyle(
                            fontSize: 25,
                          ),)
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {

          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Covid {
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int updated;

  Covid({required this.cases, required this.deaths, required this.recovered, required this.active, required this.updated});

  factory Covid.fromJson(Map<String, dynamic> jsonResponse) {
    return Covid(
        cases: jsonResponse['cases'],
        deaths: jsonResponse['deaths'],
        recovered: jsonResponse['recovered'],
        active: jsonResponse['active'],
        updated: jsonResponse['updated']
    );
  }
}