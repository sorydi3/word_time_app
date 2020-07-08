import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //location name for the ui
  String time; //time in tha location
  String flag; //url to asset flags
  String base_url;

  WorldTime({this.location, this.time, this.flag, this.base_url});

  void getTime() async {
    Response response = await get(
        'http://worldtimeapi.org/api/timezone/$base_url');
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
    time=now.toString();
  }

  @override
  String toString() {
    return 'WorldTime{location: $location, time: $time, flag: $flag, base_url: $base_url}';
  }
}
