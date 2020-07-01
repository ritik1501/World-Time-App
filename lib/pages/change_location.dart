import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Kolkata', url:'Asia/Kolkata', flag: 'india.jpg'),
    WorldTime(location: 'Dili', url:'Asia/Dili', flag: 'dili.png'),
    WorldTime(location: 'Moscow', url:'Europe/Moscow', flag: 'russia.png'),
    WorldTime(location: 'Mexico_City', url:'America/Mexico_City', flag: 'america.png'),
    WorldTime(location: 'Nairobi', url:'Africa/Nairobi', flag: 'nairobi.png'),
    WorldTime(location: 'Los Angeles', url:'America/Los_Angeles', flag: 'america.png'),
    WorldTime(location: 'NewYork', url:'America/New_York', flag: 'america.png'),
    WorldTime(location: 'Kabul', url:'Asia/Kabul', flag: 'afganistan.png'),
    WorldTime(location: 'Tokyo', url:'Asia/Tokyo', flag: 'tokyo.png'),
    WorldTime(location: 'Sydney', url:'Australia/Sydney', flag: 'sydney.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                  print(locations[index].url);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/'+locations[index].flag),
                ),
              ),
            ),
          );
        }

      )
    );
  }
}
