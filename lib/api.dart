import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'http://172.104.202.219:8080/';

Future loginUser(String username, String password) async {

  String loginUrl = url + 'login';
  http.Response  response =  await http.post(loginUrl,
  headers:  <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
    return response;
  }


Future registerUser(String username, String password) async {
  String registerUrl = url + 'register';
  final response = await http.post(registerUrl,
    headers:  <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
    print(response.body);
  print(response.headers);
  print(response.statusCode);
    return response.statusCode;
  }


