import "package:flutter/material.dart";
import 'package:flutter_application_2/Search.dart';

class Sample1 extends StatefulWidget {
  const Sample1({Key? key}) : super(key: key);

  @override
  State<Sample1> createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
            height: 10,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.black,
            )),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Search())));
        },
      ),
    );
  }
}
