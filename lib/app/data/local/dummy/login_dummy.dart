import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/app/data/mountain_metadata.dart';
import 'package:myapp/app/data/response/mountain_info_response.dart';
import 'package:myapp/app/data/source/login_data_source.dart';
import 'package:http/http.dart' as http;

class LoginDummy implements LoginDataSource {
  @override
  Future<MountainInfoResponse> getMountainInfo({required String id}) async {
    Map<String, dynamic> result = await asyncMountainList(id);

    return Future(() => MountainInfoResponse(
      type: "SUCCESS",
      errorMessage: null,
      result: MountainInfoResult.fromJson(result),
    ));
  }

  Future<Map<String, dynamic>> asyncMountainList(String id) async {
    final url = Uri.parse('http://43.201.65.109:3000/api/dict?id=$id');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return (json.decode(response.body));  // JSON 응답을 Map으로 디코딩
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}