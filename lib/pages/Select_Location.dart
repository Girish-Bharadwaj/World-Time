import 'package:flutter/material.dart';


class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override

  void getData() async {
    String username= await Future.delayed(Duration(seconds: 3),() {
        return("Tony Stark");
      });

    String bio= await Future.delayed(Duration(seconds: 1),() {
      return ("Iron man");
    });

    print('$username - $bio');
  }
  void initState ()  {
    // TODO: implement initState
    getData();
    print("Init");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("Build State");
    return Scaffold(
      appBar: AppBar(
        title: Text("Select location"),
      ),
      body: Text("Select Location"),
    );
  }
}
