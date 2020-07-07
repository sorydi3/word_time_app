import 'package:flutter/material.dart';
import 'package:http/http.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter=0;
  void getData() async{

  }
  @override
  Widget build(BuildContext context) {
    print('build called because of set state method');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter+=1;
          });
        },
        child: Text(' counter is $counter'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('init state called once');
    getData();
    //run first whnt state widget is created
  }
}
