import 'package:flutter/material.dart';
import 'package:word_time_app/services/word_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(base_url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(
        base_url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(base_url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        base_url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(
        base_url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        base_url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        base_url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        base_url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(idx) async{
    WorldTime worldTime = locations[idx];
    await worldTime.getTime();
    Navigator.pop(context,{
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }
  @override
  Widget build(BuildContext context) {
    print('build called because of set state method');
    return Scaffold(
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, idx) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                   updateTime(idx);
                  },
                  title: Text(locations[idx].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/${locations[idx].flag}',
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    print('init state called once');
    //run first whnt state widget is created
  }
}
