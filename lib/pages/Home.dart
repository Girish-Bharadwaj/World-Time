import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    String img=data["isDayTime"] ? "sun_rise.jpg" : "moon_rise.jpg";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("World Time"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$img"),
              fit: BoxFit.fitHeight
            )
          ),
          child: Column(
            children: [
              SizedBox(height:20),
              TextButton(
                onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data={
                          "location":result['location'],
                          "isDayTime":result['isDayTime'],
                          "time":result['time'],
                        };
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,color: Colors.white,),
                    SizedBox(width: 5,),
                    Text("Edit Location",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Text(
                  data['location'],
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 10,),
              Text(
                  data['time'],
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
