import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_api.dart';


class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {

  List<WorldTime> locations=[
    WorldTime(url: "Asia/Kolkata", location: "Kolkata"),
    WorldTime(url: "America/Chicago", location: "Chicago"),
    WorldTime(url: "America/New_York", location: "New York"),
    WorldTime(url: "Australia/Sydney", location: "Sydney"),
    WorldTime(url: "Europe/London", location: "London"),
  ];
  void getTime(int index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "time":instance.time,
      "location":instance.location,
      "isDayTime":instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build State");
    return Scaffold(
      appBar: AppBar(
        title: Text("Select location"),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () { getTime(index); },
                title: Text(locations[index].location),
              ),
            );
          },
      ),
    );
  }
}
