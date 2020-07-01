import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments ;
//    print(data);

    String bgImage = data['isDayTime']?'day.png':'night.png';
    Color bgColor = data['isDayTime']?Colors.red:Colors.indigo[500];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:  Container(
            decoration: BoxDecoration(
              image: DecorationImage (
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                     dynamic result =  await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time' : result['time'],
                         'location' : result['location'],
                         'isDayTime' : result['isDayTime'],
                         'flag' : result['flag']
                       };
                     });
                    },
                    color: Colors.grey[50],
                    icon: Icon(Icons.add_location),
                    label: Text('Edit Location'),
                  ),
                  SizedBox(height:100.0),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/"+data['flag']),
                    radius: 50.0,
                  ),
                  SizedBox(height: 50.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height:30.0),
                  Text(data['time'],
                    style: TextStyle(
                        fontSize: 60.0,
                        color:Colors.white,
                        fontStyle: FontStyle.italic
                    ),),
                ],
              ),
            ),
          )
      ),
    );
  }
}
