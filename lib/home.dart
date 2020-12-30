import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 Map data = {};
  @override
  Widget build(BuildContext context) {
    //if its already updated with values from choose location screen its not empty and keep using (data )
    //but if its empty use initial arguments.
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;


    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
    backgroundColor: bgColor,
     // appBar: AppBar(
       // title : Text('home page'),
        //centerTitle: true,
        //backgroundColor: Colors.blueGrey,
        
      //),
     body:  SafeArea(
       child :Container(
         decoration: BoxDecoration(
           image : DecorationImage(
             image: AssetImage('assets/$bgImage'),
                 fit: BoxFit.cover,
           )
         ),
         child: Padding(
             padding: const EdgeInsets.fromLTRB(0, 120.0, 0,0),

           child : Column(
          children : <Widget>[

            FlatButton.icon(
              onPressed:()  async{
            dynamic result = await Navigator.pushNamed(context, '/location');
            setState(() {
              data ={
              'time' : result['time'],
              'location' : result['location'],
              'flag' : result['flag'],
              'isDaytime' : result['isDaytime'],};
            });
                },
            icon :Icon(Icons.edit_location),
              color :Colors.grey[300],
              label : Text(
                  'edit location',
                   style : TextStyle(
                     //color: Colors.grey[300]
                   )
              )

              ,
            ),
            SizedBox(height:  20.0),
            Text('press this button to change country',
              style: TextStyle(
                color: Colors.white,

              ),
            ),

            SizedBox(height:  20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children :<Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  )
                  ,
                ),
                SizedBox(width:  10.0),
                Text(
                  data['time'],
                  //'razan',
                  style : TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),

                )


              ]

            )


          ]

     )

),
       )

     )

    );
  }
}