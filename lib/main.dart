import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute:  '/',
  routes :{
    '/' :(context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));

