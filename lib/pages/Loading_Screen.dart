import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getTime() async{
    WorldTime instance=WorldTime(url: "Asia/Kolkata", location: 'Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "time":instance.time,
      "location":instance.location,
      "isDayTime":instance.isDayTime,
    });
  }
  @override
  void initState() {
    getTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SafeArea(
          child: SpinKitThreeBounce(
            color: Colors.blue,
            size: 50.0,
          )
          ),
        )
    );
  }
}
