import 'dart:ffi';

import 'package:customar_app/util/index_path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> otpController() async {
  const String apiUrl = 'https://example.com/api/post';

  final Map<String, dynamic> requestData = {
    'number': 65478900743,
  };

  final String requestBody = json.encode(requestData);

  final http.Response response = await http.post(Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBody);

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
  } else {
    print('Failed to post data: ${response.statusCode}');
  }
}

final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

Future<void> login(String email, String password) async {
  final url = Uri.parse('http://192.168.0.106:3001/api/auth/signin');
  try{
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    print("this is response ${response}");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      print(responseData);
      print(responseData);

      // store the token or do something else with it
    } else {
      throw Exception('Failed to login');
    }
  } catch (e) {
    // TODO: Handle the error if the user creation fails
    print("Failed to create user: $e");
  }
}

Future<void> createUser(String firstName, String lastName, String email) async {
  final url = Uri.parse('http://192.168.0.106:3001/api/users');
  try{
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'firstName': firstName,'lastName': lastName,'email': email, 'roles' : ["customer"], 'status': "ACTIVE",}),
    );

    print("this is response ${response}");
    print("this is payload ${json.encode({'firstName': firstName,'lastName': lastName,'email': email, 'roles' : ["customer"], 'status': "ACTIVE",})}");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      print(responseData);
      print(token);
    } else {
      print("Failed to create user: ${response.statusCode},${response.body}");
      throw Exception('Response');
    }
  } catch (e) {
    // TODO: Handle the error if the user creation fails
    print("Failed to create user: $e");
    Get.defaultDialog(title: "oops!",middleText: "${e.toString()}");
  }
}


