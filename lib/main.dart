// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:worldtimemap/pages/choose_location.dart';
import 'package:worldtimemap/pages/home.dart';
import 'package:worldtimemap/pages/loading.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ));
