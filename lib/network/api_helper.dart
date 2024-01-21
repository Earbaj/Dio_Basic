

import 'package:dio/dio.dart';

import '../model/jsonModel.dart';

class SuperheroApiHelper{
  final String apiUrl = 'https://protocoderspoint.com/jsondata/superheros.json';
  Future<SuperheroList> fetchData() async {
    final dio = Dio();
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        return SuperheroList.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    }
  }

}