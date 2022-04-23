import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.directions_car,
                    color: Colors.blue,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.directions_transit,
                    color: Colors.blue,
                  ),
                ),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      children: [
        Image.asset('assets/images/dating_background.png'),
        Container(
          height: 300,
          width: 300,
          color: Colors.red,
        ),
        Container(
          height: 300,
          width: 300,
          color: Colors.green,
        ),
        Container(
          height: 300,
          width: 300,
          color: Colors.blue,
        ),
      ],
    );
  }
}
