import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 90,
            ),
            _topColum(),
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
            borderRadius: BorderRadius.circular(10)),
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
                padding: const EdgeInsets.only(top:10.0,bottom: 5),
                child: Container(height: 1,width: 3000,color: Colors.white,),
              ),
              const Text('See More',
              style: TextStyle(color: Colors.white, fontSize: 15),)

            ],
          ),
        ),
      );

  Column _topColum() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Seatle',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          Text(
            '79˚',
            style: TextStyle(color: Colors.white, fontSize: 80),
          ),
          Text(
            'Mostly Sunny',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'H:90˚ L:69˚',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      );
}
