import 'dart:convert';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    //data = jsonDecode(dataL.toString());

    String backgroundImage = data["isDayTime"] ? "day.png" : "night.png";
    Color backgroundColor = data["isDayTime"] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/$backgroundImage"),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: TextButton.icon(onPressed: (){
                      Navigator.pushNamed(context, "/location");
                    },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label:
                      Text("Edit Location",
                        style: TextStyle(
                            color: Colors.grey[300]
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data["location"],
                        style: TextStyle(
                          color: Colors.grey[200],
                          letterSpacing: 2.0,
                          fontSize: 28.0
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Text(data["time"],
                    style: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 66.0
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
