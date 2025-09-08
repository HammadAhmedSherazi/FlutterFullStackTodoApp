// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapp/export_all.dart';

class ApiService {
  Map<String, String>? reqData;
  //REGISTRATION API
  static registrationApi(
      Map<String, String> reqData, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => spinkit,
    );
    final response = await http.post(Uri.parse('$apiUrl/registration'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqData));

    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status']) {
      
      Navigator.of(context)
        ..pop()
        ..pop();
    }
    else{
      messageDialog('Something is wrong');
      Navigator.of(context).pop();
    }
  }

  //LOGIN API
  static loginApi(Map<String, String> reqData, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => PopScope(
        child: spinkit,
        onPopInvokedWithResult: (didPop, result) {
          return;  
        },
        
      ),
    );
    final response = await http.post(Uri.parse('$apiUrl/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqData));

    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status']) {
      token = jsonResponse['token'];
      //     Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      // // Now you can use your decoded token
      // // print(decodedToken);
      // userId = decodedToken["_id"];

      // ApiService().reqData = {
      //   "userId": jsonResponse['userId'].toString(),
      // };
      Data.userDetail = User.fromJson(jsonResponse['user']);
      userId = Data.userDetail!.sId!;
      
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/HomeScreen', (Route<dynamic> route) => false);
    } else {
      messageDialog(jsonResponse['message']);
      
      Navigator.pop(context);
    }
  }

  // ignore: todo
  //ADD TODO API
  static Future<TodoModel?> addTodoApi(
      Map<String, String> reqData, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => PopScope(
        child: spinkit,
        onPopInvokedWithResult: (didPop, result) {
          return;
        },
      ),
    );
    final response = await http.post(Uri.parse('$apiUrl/saveTodo'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqData));

    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status']) {
      
      Navigator.of(context)
        ..pop()
        ..pop();

      TodoModel item = TodoModel.fromJson(jsonResponse['success']);
      return item;
    } else {
      Navigator.of(context)
        ..pop()
        ..pop();

      // throw Exception(response.reasonPhrase);
    }
    return null;
  }

  Future<List<dynamic>> getTodoList() async {
    final response = await http.post(Uri.parse('$apiUrl/getTodosList'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"userId": userId}));

    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == 200 && jsonResponse['success']) {
      // List todoList = [];

      return jsonResponse['todos'].map((e) => TodoModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<bool> deteteTodoApi(String todoId, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => PopScope(
        child: spinkit,
        onPopInvokedWithResult: (didPop, result) {
          return;
        },
        // onWillPop: () async {
        //   return false;
        // },
      ),
    );
    final response = await http.post(Uri.parse('$apiUrl/deleteTodo'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": todoId}));

    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == 200 && jsonResponse['success']) {
      
      Navigator.of(context)
        .pop();
      return jsonResponse['success'];
    } else {
      
      // Navigator.of(context)..pop();

      throw Exception(response.reasonPhrase);
    }
  }

  static Future<TodoModel?> updateTodo(Object item) async {
    final response = await http.patch(Uri.parse('$apiUrl/updateTodo'),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(item));
    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse['status'] == 200 && jsonResponse['success']) {
      return TodoModel.fromJson(jsonResponse['todo']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
