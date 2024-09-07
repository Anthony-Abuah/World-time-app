import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime{

  late String location; // location name for the ui
  late String time; // time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoints
  late bool isDayTime; // true or false if daytime

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      // Simulate network call for userName
      var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      var datetime = data["datetime"];
      var offset = data["utc_offset"];
      DateTime londonDateTime = DateTime.parse(datetime);
      londonDateTime = londonDateTime.add(Duration(hours: int.parse(offset.substring(1,3))));

      isDayTime = (londonDateTime.hour > 6 && londonDateTime.hour < 20) ? true : false;
      //isDayTime = true;
      time = DateFormat.jm().format(londonDateTime);
    }
    catch(e){
      time = "Unable to load time";
    }
  }

}