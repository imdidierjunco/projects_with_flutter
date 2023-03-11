import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../data/models/models.dart';

import 'package:http/http.dart' as http;

class HttpService {
  static String _url = '';
  static String _apiKey = '';

  HttpService() {
    _url = 'https://gorest.co.in/public/v2';
    _apiKey =
        '5b5e16033db9a2fb22e08f5deec9a5dbcd00d86b4cbd9569d0b7f5df0a7edc1e';
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      final resp = await http.get(
        Uri.parse('$_url/users'),
        headers: {'Authorization': 'Bearer $_apiKey'},
      );
      if (resp.statusCode != 200) {
        if (kDebugMode) {
          print(
            'HttpService getAllUsers: ${resp.statusCode}',
          );
        }
        return [];
      }
      return (jsonDecode(resp.body) as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('HttpService getAllUsers: $e');
      }
      return [];
    }
  }

  Future<List<PostModel>> getPostUser(int idUser) async {
    try {
      final resp = await http.get(
        Uri.parse('$_url/users/$idUser/posts'),
        headers: {'Authorization': 'Bearer $_apiKey'},
      );
      if (resp.statusCode != 200) {
        if (kDebugMode) {
          print(
            'HttpService getPostUser: ${resp.statusCode}',
          );
        }
        return [];
      }
      return (jsonDecode(resp.body) as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('HttpService getPostUser: $e');
      }
      return [];
    }
  }
}
