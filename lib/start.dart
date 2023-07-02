import 'package:flutter/material.dart';
import 'package:flutter_application_2/Weather1.dart';
import 'package:flutter_application_2/Search.dart';
import 'package:flutter_application_2/weather3.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

late var s2;

class Start extends StatefulWidget {
  late String text;
  Start(@required this.text, {Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    s2 = widget.text;
    apicall();
    super.initState();
  }

  var mapresponse;
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${s2}&appid=1432113d4f1a6dc38638073ad3733e1e"));
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // initState();
    // apicall();
    return Material(
      color: Color(0xFF1A237E),
      child: Container(
        padding: EdgeInsets.all(0.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/2.jpg"), fit: BoxFit.fill),
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
                const SizedBox(width: 240),
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
                SizedBox(
                  height: 400,
                  width: 362,
                  child: Image.asset(
                    "assets/image/9.png",
                    fit: BoxFit.cover,
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
                        mapresponse!['main']['temp'].toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontStyle: FontStyle.italic),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
