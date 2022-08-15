// ignore_for_file: prefer_const_constructors,, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:worldtimemap/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: "Kolkata", url: "Asia/Kolkata"),
    WorldTime(location: "Berlin", url: "Europe/Berlin"),
    WorldTime(location: "Cairo", url: "Africa/Cairo"),
    WorldTime(location: "Nairobi", url: "Africa/Nairobi"),
    WorldTime(location: "Chicago", url: "America/Chicago"),
    WorldTime(location: "New York", url: "America/New_York"),
    WorldTime(location: "Seoul", url: "Asia/Seoul"),
    WorldTime(location: "Jakarta", url: "Asia/Jakarta")
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Location",
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
              ),
            )),
        itemCount: locations.length,
      ),
    );
  }
}
