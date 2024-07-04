import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myapp/data/api_path.dart';
import 'package:myapp/models/news.dart';

class APIProvider {
  late final Dio client;
  APIProvider() {
    client = Dio(
      BaseOptions(
        baseUrl: ApiPath.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<List<News>> getNewest({String? category}) async {
    final response = await client.get(ApiPath.newest);

    final datas = List<News>.from(json.decode(response.data).map((e) => News.fromJson(e)).toList());

    if (category != null) {
      return datas.where((element) => element.category.contains(category)).toList();
    } else {
      return datas;
    }
  }

  Future<List<News>> getFeatured() async {
    final response = await client.get(ApiPath.featured);

    return List<News>.from(json.decode(response.data).map((e) => News.fromJson(e)).toList());
  }

  Future<List<String>> getCategory() async {
    final response = await client.get(ApiPath.category);

    return List<String>.from(json.decode(response.data).map((e) => e).toList());
  }

  Future<News> getDetail(int id) async {
    final response = await client.get(ApiPath.detail);
    final datas =List<News>.from(json.decode(response.data).map((e) => News.fromJson(e)).toList());

    return datas.where((element) => element.id == id).first;
  }
}
