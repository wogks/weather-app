import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi{
  Future<Map<String,dynamic>> getWeather(String query) async {
    Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');

      http.Response response = await http.get(url);
      String jsonString = response.body;

      Map<String, dynamic> json = jsonDecode(jsonString);
      if (json['name'] == null) {
        return {};
      }

      Map<String, dynamic> weatherName = json['name'];
      return weatherName;
  }
}