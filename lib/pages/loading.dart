import 'package:flutter/material.dart';
import 'package:word_time_app/services/word_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
   String time='loading';
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', base_url: 'Europe/Berlin');
    await worldTime.getTime();
    String time = worldTime.time;
    Navigator.pushReplacementNamed(context, '/home',arguments: { //send data to home screen

      'location':worldTime.location,
      'flag':worldTime.flag,
      'time': worldTime.time,
    });
  }

  @override
  void initState() {
    super.initState();
    print('init state called');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sdsdsd'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: SafeArea(child: Text('time is $time')),
      )
    );
  }
}
