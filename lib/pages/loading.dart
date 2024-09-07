import 'package:flutter/material.dart';
import 'package:world_time_flutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  final WorldTime? worldTime;
  const Loading( {super.key, required this.worldTime});

  @override
  State<Loading> createState() => _LoadingState(worldTime);
}

class _LoadingState extends State<Loading> {
  Map data = {};
  WorldTime? worldTime;
  _LoadingState(WorldTime? thisWorldTime){
    worldTime = thisWorldTime;
  }

  void setupWorldTime() async {
    //_worldTime!  ? WorldTime(location: "London", flag: "london.png", url: "Europe/London") : _worldTime;
    //WorldTime instance = WorldTime(location: "London", flag: "london.png", url: "Europe/London");
    WorldTime newWorldTime = (worldTime == null) ? WorldTime(location: "London", flag: "london.png", url: "Europe/London") : worldTime!;
    await newWorldTime.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": newWorldTime.location,
      "flag": newWorldTime.flag,
      "time": newWorldTime.time,
      "isDayTime": newWorldTime.isDayTime,
    }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
