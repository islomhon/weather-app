import 'package:flutter/material.dart';


class weather_app extends StatefulWidget {
  const weather_app({super.key});

  @override
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            //animated align: location and string text
            AnimatedAlign(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "region",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      'Good morning!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              alignment: Alignment.topLeft,
              duration: Duration(seconds: 9),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/2.png"))),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      '3c',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          'CLOUDS',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          "Wednesday 18. 2:21 PM",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //surnise
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/11.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Surnise",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Text(
                                '7:34 AM',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      //sunset
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/12.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sunset",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Text(
                                '4:51 PM',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //surnise
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/13.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Temp Max",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Text(
                                '3c',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      //sunset
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/14.png"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Temp Min",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Text(
                                '3c',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/fon.jpg"), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
