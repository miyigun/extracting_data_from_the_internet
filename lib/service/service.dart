import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:extracting_data_from_the_internet/model/user_model.dart';
import 'package:flutter/material.dart';

class Service {
  static Future<UserModel?> fetch() async {
    var url=Uri.parse("https://reqres.in/api/users?page=1");
    http.Response response;

    try {
      response=await http.get(url);

      if(response.statusCode==200){
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch(e){
      debugPrint(e.toString());
      return null;
    }
  }
}