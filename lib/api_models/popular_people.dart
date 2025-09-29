import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/api_models/popular_people_json.dart';
import 'package:http/http.dart' as http;
class PopularPeople {
  static Map<String, String> headers = {"Accept": "application/json"};
  static String url =
      'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b';
  static Future<PopularPeopleJson?> getPeopleData () async {
    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return PopularPeopleJson.fromJson(json.decode(response.body));
    } else {
      log("An Error Occurred");
      return null;
    }
  }
}
