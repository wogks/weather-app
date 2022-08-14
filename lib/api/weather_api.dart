import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheather_app/model/weather_model_class.dart';

class WeatherApi{
  Future<WeatherModelClass> getWeather(String query) async {//쿼리를 통해 쿼리 검색한거에 해당하는 정보 다가져옴
    Uri url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');

      http.Response response = await http.get(url);
      String jsonString = response.body;

      Map<String, dynamic> json = jsonDecode(jsonString);
      
  
      String weatherName = json['name'] as String;
      num weatherTemp = json['main']['temp'] as num;
      String weather = json['weather'][0]['main'] as String; //웨더 스트링에서 첫번째 덩어리에서 메인의 밸류값
      print(weather);
      //여기서 필요한걸 가져오고

      return WeatherModelClass(name: weatherName, temp: weatherTemp, weather: weather);

      
  }
}