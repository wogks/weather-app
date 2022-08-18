import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/view_model/weather_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _texteditingcontroller = TextEditingController();
  @override
  void dispose() {
    _texteditingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/weather.jpeg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _texteditingcontroller,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      viewModel.fetchWeatherInfo(_texteditingcontroller.text);
                    },
                    child: const Icon(Icons.search),
                  ),
                  hintText: '검색어를 입력하세요',
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  viewModel.name.name,
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  viewModel.name.temp.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 80),
                ),
                Text(
                  viewModel.name.weather, //첫번
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                 ( '풍속 : ${viewModel.name.wind.toString()}'),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _middleContainer(),
            )
          ],
        ),
      ),
    );
  }

  Container _middleContainer() => Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 35, 25, 124),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.notification_important,
                    color: Colors.white,
                  ),
                  Text(
                    ' Excessive Heat Warning',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'National Weather Service: Excessive Heat Warning in Seattle and civinity',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                child: Container(
                  height: 1,
                  width: 3000,
                  color: Colors.white,
                ),
              ),
              const Text(
                'See More',
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
      );
}
