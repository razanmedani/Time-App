import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setUpTime() async {

    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png',url: 'Africa/Khartoum');
   await instance.getTime(); //this is asyncronus func it runs in the background so the  code doesnot stop here so we need jto write await befor printing any value.
    ///future written in getTime() tells darts when a sync func is complete so it returns void only after func completion
   // print(instance.time);
 //   setState((){
   //   time = instance.time;
    Navigator.pushReplacementNamed(context, '/home' , arguments: {

      'location': instance.location,
      'flag' : instance.flag ,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    } );
    //});
  }
  @override
  void initState() {
    super.initState();
    setUpTime();
  }
  @override
  Widget build(BuildContext context) { // build is responsible of building the root tree
    return Scaffold(
      backgroundColor: Colors.blueGrey,
    // body : SafeArea(child: Text(time)),
      body : Center(
      child : SpinKitCubeGrid(
        color: Colors.white,
        size: 80.0,
      ),
      )
    );
  }
}

