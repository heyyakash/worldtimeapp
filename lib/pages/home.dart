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
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImg = data['isDayTime']
        ? "https://images.unsplash.com/photo-1588746853740-bd35aad10bfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
        : "https://images.unsplash.com/photo-1505322022379-7c3353ee6291?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(bgImg), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
              onPressed: () async {
                dynamic res = await Navigator.pushNamed(context, '/location');
                print(res);
                setState(() {
                  data = {
                    'location': res['location'],
                    'time': res['time'],
                    'isDayTime': res['isDayTime']
                  };
                });
              },
              icon: Icon(Icons.map),
              label: Text(
                "Edit Location",
                style: TextStyle(
                    color: (data['isDayTime'] ? Colors.black : Colors.white)),
              )),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              data['location'],
              style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: (data['isDayTime'] ? Colors.black : Colors.white)),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Text(
            data['time'],
            style: TextStyle(
                fontSize: 30,
                color: (data['isDayTime'] ? Colors.black : Colors.white)),
          )
        ],
      ),
    ));
  }
}
