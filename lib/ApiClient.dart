import 'dart:io';

import 'package:api_example/model/Post.dart';
import 'package:http/http.dart' as http;

class ApiClient{
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(url);
    if(response.statusCode == HttpStatus.ok){
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}