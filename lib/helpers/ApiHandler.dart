import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'error_handler.dart';

class ApiHandler {

  static Future<dynamic> post (uri,{body}) async {
    try {
      Uri url = Uri.parse(uri);
      http.Response response = await http.post(url,  body: body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 101);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 102);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 103);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 104);
    }
  }

  static Future<dynamic> get (String uri) async {
    try {
      Uri url = Uri.parse(uri);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 101);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 102);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 103);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 104);
    }
  }
}