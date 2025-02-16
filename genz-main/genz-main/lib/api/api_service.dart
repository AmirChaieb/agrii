import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:yoser/models/post.dart';

import '../config.dart';


final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();

  Future<List<Post>?> getPosts(Category, page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};

    Map<String, String> queryString = {
      'Category' : Category,
      'page' : page.toString(),
      'pageSize' : pageSize.toString()
    };

    var url = Uri.http(Config.apiURL, Config.postAPI, queryString);

    var response = await client.get(url, headers : requestHeaders);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return postsFromJson(data["data"]);
    }
    else {
      return null ;
    }
  }
}