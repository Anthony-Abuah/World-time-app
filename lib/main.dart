import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:world_time_flutter/pages/choose_location.dart';
import 'package:world_time_flutter/pages/home.dart';
import 'package:world_time_flutter/pages/loading.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const Loading(worldTime: null),
      "/home": (context) => const Home(),
      "/location": (context) => const ChooseLocation(),
    },
  ));
}