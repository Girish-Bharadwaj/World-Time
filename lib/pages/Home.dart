import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("World Time"),
      ),
      body: TextButton(
        onPressed: (){
          Navigator.pushNamed(context, "/location");
        },
        child: Text("Select Location"),
      ),
    );
  }
}
