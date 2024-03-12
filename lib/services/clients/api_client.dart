import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:p_catapi/core/errors/exceptions.dart';

import '../models/cat.dart';

abstract class ApiClient {
  Future<List<Cat>> getCatBreeds();
  Future<CatImage> getCatImage(String id);
}

@Injectable(as: ApiClient)
class ApiClientImpl implements ApiClient {
  final http.Client httpClient = http.Client();

  @override
  Future<List<Cat>> getCatBreeds() async {
    final http.Response response = await httpClient.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {
        'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
      },
    );
    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        List<Cat> catBreeds =
            jsonList.map((json) => Cat.fromJson(json)).toList();

        return catBreeds;
      } else {
        throw GeneralException();
      }
    } catch (e) {
      throw GeneralException();
    }
  }

  @override
  Future<CatImage> getCatImage(String id) async {
    final http.Response response = await httpClient.get(
      Uri.parse('https://api.thecatapi.com/v1/images/$id'),
    );

    if (response.statusCode == 200) {
      var catImageResponse = CatImage.fromJson(json.decode(response.body));

      return catImageResponse;
    } else {
      throw GeneralException();
    }
  }
}
