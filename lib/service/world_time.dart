import 'package:http/http.dart';
import 'package:intl/intl.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert'; //converts string into data we can work with (example jsonDecode)

 class WorldTime{

   String location ;//location name for the ui
   String  time = 'loading';//time in the location
   String flag;//url to an asset flag icon
   String url ; //location jurl for api endpoints
   bool isDaytime = true; //true or false if daytimne or not.


   WorldTime({this.location, this.flag , this.url});

   Future<void> getTime() async{
     try{
   // Response respone = await get('https://jsonplaceholder.typicode.com/todos/1');
   //print(respone.body) this returns string of objects that we canot use it so we use jsonDecode
   // Map data =jsonDecode(respone.body); //the body property is the actual json string we got
   //print(data);
   //print(data['title']);//title is one of the keys of the map
   Response response = await get('http://worldtimeapi.org/api/timezone/$url');

   Map data = jsonDecode(response.body);
   String datetime = data['datetime'];
   String offset = data['utc_offset'].substring(1,3);
   // print(datetime);
   //print(offset);
   DateTime now = DateTime.parse(datetime);
   now = now.add(Duration (hours: int.parse(offset)));
   // print(now);
   //set the time propperty
  // time = now.toString();

   isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

   time = DateFormat.jm().format(now); // its then better to read it

   }catch(e){
  print('caught error : $e');
  time = 'could not get time data';

   }




}}


