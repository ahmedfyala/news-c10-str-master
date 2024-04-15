import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c10_str/shared/components/constants.dart';

import '../../../models/NewsResponse.dart';
import '../../../models/source_reposne.dart';

class ApiManager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=
  static Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": "acd1c91230964a57a37ec1d124e459c8","category": category});
    http.Response resposne = await http.get(url);
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri url =
        Uri.https(Constants.BASE_URL, "/v2/everything", {"sources": sourceId});
    var resposne = await http
        .get(url, headers: {"x-api-key": "acd1c91230964a57a37ec1d124e459c8"});

    var json = jsonDecode(resposne.body);
    print("-------------------------------->${resposne.body}");
    return NewsResponse.fromJson(json);

  }
  static Future<NewsResponse> getNewsSearchData(String quary) async {
    Uri url =
        Uri.https(Constants.BASE_URL, "/v2/everything", {"q": quary});
    var resposne = await http
        .get(url, headers: {"x-api-key": "acd1c91230964a57a37ec1d124e459c8"});

    var json = jsonDecode(resposne.body);
    print("-------------------------------->${resposne.body}");
    return NewsResponse.fromJson(json);

  }
}
