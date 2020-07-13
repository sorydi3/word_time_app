import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the ui
  String time; //time in tha location
  String flag; //url to asset flags
  String base_url;
  bool isDayTime;
  WorldTime({this.location, this.flag, this.base_url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$base_url');
      Map data = jsonDecode(response.body);
      print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
//    print(datetime);
//    print(offset);
      //create a objet
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      this.time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      this.time = "could not request data";
    }
  }

  @override
  String toString() {
    return 'WorldTime{location: $location, time: $time, flag: $flag, base_url: $base_url}';
  }
}
