
import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/choosing_location.dart';
import 'package:world_clock/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context)=>const Loading(),
      '/home': (context)=>const Home(),
      '/Location': (context)=>const ChooseLocation(),
    },
  ));
}


