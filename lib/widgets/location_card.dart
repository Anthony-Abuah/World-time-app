import 'package:flutter/material.dart';
import 'package:world_time_flutter/services/world_time.dart';




class LocationCard extends StatelessWidget {
  final WorldTime worldTime ;
  final Function onTapItem;
  const LocationCard({super.key, required this.worldTime, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          onTapItem(worldTime);
        },
        title: Text(worldTime.location),
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/${worldTime.flag}"),
        ),
      ),
    );
  }
}
