import 'package:flutter/material.dart';
import 'package:world_time_flutter/pages/loading.dart';
import 'package:world_time_flutter/widgets/location_card.dart';

import '../services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> worldTimes = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Choose Location",
          style: TextStyle(
            color: Colors.grey[100],
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
          itemCount: worldTimes.length,
            itemBuilder: (context, index){
            return LocationCard(
              worldTime: worldTimes[index],
              onTapItem: (worldTime){
                //print("I tapped ${worldTimes[index].location}");
                print("I tapped ${worldTime.location}");
                //Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Loading(worldTime: worldTime),
                  ),
                );


              },
            );
            }),
      )
    );
  }
}
