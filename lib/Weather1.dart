import 'dart:convert';

import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import "package:http/http.dart" as http;
import 'package:weather_icons/weather_icons.dart';

Map? mapresponse;
Map? mainresponse;
Map? nameresponse;
List? Listresponse;

class Weatherhome extends StatefulWidget {
  const Weatherhome({Key? key}) : super(key: key);

  @override
  State<Weatherhome> createState() => _WeatherhomeState();
}

String string = 'Hit Me';

class _WeatherhomeState extends State<Weatherhome> {
  @override
  void initState() {
    apicall();
    super.initState();
  }

  Future apicall() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat, long;

    lat = position.latitude;
    long = position.longitude;
    String l1, l2;
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=1432113d4f1a6dc38638073ad3733e1e"));
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = jsonDecode(response.body);
        l1 = mapresponse!['main']['temp'].toString();
      });
    }
  }

  String? s4;
  Convert(String s) {
    int a;
    a = int.parse(s);
    a = a - 273;
    s4 = a.toString();
  }

  String? temp;
  String message = 'Hit me';
  bool changebutton = false;
  // ignore: non_constant_identifier_names
  String message2 = '';
  void getCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat, long;
    lat = position.latitude;
    long = position.longitude;
    String l1, l2;
    l1 = "$lat";
    l2 = "$long";
    message2 = l1;
    message = l2;
    setState(() {
      changebutton = true;
    });
  }

  void clearlocation() {
    message2 = '';
    message = '';
    changebutton = false;
    setState(() {});
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF1A237E),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/2.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Column(
                  children: const [
                    SizedBox(height: 10),
                    Text(
                      "   Full",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "   sun",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "   day",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Expanded(child: const SizedBox(width: 240)),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 0.0,
                  child: Ink(
                    child: IconButton(
                        iconSize: 25,
                        onPressed: () {
                          Navigator.pushNamed(context, 'Search');
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: SizedBox(
                    height: 400,
                    width: 362,
                    child: Image.asset(
                      "assets/image/9.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                mapresponse == null
                    ? Text("")
                    : Text(
                        mapresponse!['name'].toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                mapresponse == null
                    ? const Text(
                        "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      )
                    : const Text(
                        ", ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                mapresponse == null
                    ? const Text("")
                    : Text(
                        mapresponse!['sys']['country'].toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
              ],
            ),
            Row(
              children: [
                mapresponse == null
                    ? Text("")
                    : Text(
                        (mapresponse!['main']['temp'].toString()),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontStyle: FontStyle.italic),
                      ),
                Container(
                  alignment: Alignment.center,
                  child: Icon(
                    WeatherIcons.degrees,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
