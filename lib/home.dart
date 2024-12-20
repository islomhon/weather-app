import 'dart:convert';
import 'dart:core'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class weather_app extends StatefulWidget {
  const weather_app({super.key});

  @override
  State<weather_app> createState() => _weather_appState();
}

class _weather_appState extends State<weather_app> {
  String location = "";
  String weather = "";
  String image = '';
  String tempMax = ""; // Maksimal harorat
  String tempMin = ""; // Minimal harorat
  String Surnise = '';
  String Sunset = '';
  String temperature = ""; // Harorat uchun yangi o'zgaruvchi

  String getGreeting() {
    // Hozirgi vaqtni olish
    int hour = DateTime.now().hour;

    // Vaqtga qarab xush kelibsiz xabarini chiqarish
    if (hour >= 1 && hour < 12) {
      return "Good morning";
    } else if (hour >= 12 && hour < 18) {
      return "Good afternoon";
    } else {
      return "Good night";
    }
  }


  Future<void> get() async {
    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=40b2851af21546fbbd294943232312&q=kokand&days=2&aqi=yes&alerts=yes";
    try {
      // API ga so'rov yuborish
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Javobni qayta ishlash
        Map<String, dynamic> malumot = jsonDecode(response.body);
        setState(() {
          location = malumot['location']['name']; // Joylashuv nomini olish
          image = "http:" + malumot['current']['condition']['icon'];
          weather = malumot['current']['condition']['text']; // Hozirgi holat
          tempMax = malumot['forecast']['forecastday'][0]['day']['maxtemp_c']
              .toString();
          tempMin = malumot['forecast']['forecastday'][0]['day']['mintemp_c']
              .toString();
          Surnise = malumot['forecast']['forecastday'][0]['astro']['sunrise'];
          Sunset = malumot['forecast']['forecastday'][0]['astro']['sunset'];
          temperature =
              malumot['current']['temp_c'].toString(); // Haroratni olish
        });
      } else {
        print("Xato: ${response.statusCode}");
      }
    } catch (e) {
      print("Xato: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    get(); // API dan malumot olish
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
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
                          location,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      getGreeting(),
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
                            image: AssetImage('assets/2.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      '$temperature°C', // Haroratni ko'rsatish
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Text(
                          weather,
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
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Surnise
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
                                "Sunrise",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Text(
                                '$Surnise',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      // Sunset
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
                                '$Sunset',
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
                      // Temp Max
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
                                '$tempMax',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      // Temp Min
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
                                '$tempMin',
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
            ),
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
