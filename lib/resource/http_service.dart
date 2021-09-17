import 'dart:convert';

import 'package:buy_and_sell/resource/api_error_exception.dart';
import 'package:buy_and_sell/resource/buy_sell_responce.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static const baseUrl = "https://technical-analysis-api.com/api/v1/analysis/";
  static const token = "SC6GRKR6Q26XW4EQWKTANHRWUUFN7QKOWGQH4VMLSRUEQJMJ";

  Future<BuySellModel> getPrice(String coinName) async {
    var url = Uri.parse("${baseUrl}$coinName?apiKey=$token");
    //main url
    var response = await http.get(url);

    print(response.body);

    print(response.statusCode);

    // if (response.statusCode != 200) {
    //   throw Exception("Something went wrong");
    // }

    var jsonResponse = json.decode(response.body);
    if (!jsonResponse.containsKey('success')){
      throw ApiErrorException.fromJson(jsonResponse);
    }else{
      return BuySellModel.fromJson(jsonResponse);
    }
  }
}
