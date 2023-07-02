import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';

class Weather3 extends StatefulWidget {
  const Weather3({Key? key}) : super(key: key);

  @override
  State<Weather3> createState() => _Weather3State();
}

void getCurrentPosition() async {
  var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  var lat, long;
  lat = position.latitude;
  long = position.longitude;
}

class _Weather3State extends State<Weather3> {
  String message = '';
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
                      "Full",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "   moon",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      " light",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 220),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: IconButton(
                        iconSize: 25,
                        onPressed: () {},
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
                  height: 440,
                  width: 362,
                  child: Image.asset(
                    "assets/image/10.png",
                    fit: BoxFit.cover,
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
