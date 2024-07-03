import 'dart:convert';
import 'dart:developer';

import 'package:api_post_request/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List> postPosts(String? title, String? bodyposts, String? userId, String? id) async {
    try {
      var body = {"title": title, "body": bodyposts, "userId": userId, "id": id};
      final response = await http.post(Uri.parse(baseUrl),body: body);

      if (response.statusCode == 200) {
        dynamic responseData = jsonDecode(response.body);
        List<Postsmodel> list = [];
        list.add(Postsmodel(
            userId: responseData['userId'],
            id: responseData['id'],
            title: responseData['title'],
            body: responseData['body']));
        return list;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
