import 'package:flutter/material.dart';
import './pages/Home.dart';
import 'package:world_time_app/pages/Select_Location.dart';
import 'package:world_time_app/pages/Loading_Screen.dart';


void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>LoadingScreen(),
      '/home':(context)=>Home(),
      '/location':(context)=>SelectLocation(),
    },
  )
);
