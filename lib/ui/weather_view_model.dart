import 'package:flutter/material.dart';

import '../data/data_source/weather_api.dart';
import '../data/model/weather_model_class.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherApi _weather = WeatherApi();

  WeatherModelClass name =
      WeatherModelClass(name: '', temp: 0, weather: '', wind: 0);

  void fetchWeatherInfo(String query) async {
    name = await _weather.getWeather(query);

    notifyListeners();
  }
}

//서울 검색 - 키워드를 통해서 데이터 불러옴 - 메인화면 출력