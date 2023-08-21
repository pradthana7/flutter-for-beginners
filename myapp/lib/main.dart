import 'package:flutter/material.dart';
import 'package:myapp/pages/choose_location.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    ));
