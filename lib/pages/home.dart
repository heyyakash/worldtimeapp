// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    data = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.map),
              label: Text("Edit Location")),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              data['location'],
              style: TextStyle(fontSize: 20.0, letterSpacing: 2.0),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Text(
            data['time'],
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    ));
  }
}
