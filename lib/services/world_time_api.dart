import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime{
  late String time;
  String location;
  String url;
  late bool isDayTime;
  WorldTime({required this.url,required this.location});
  Future<void> getTime() async {
    try{
      var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response=await get(uri);
      Map body=jsonDecode(response.body);
      DateTime now=DateTime.parse(body['datetime']);
      String utc_offset=body['utc_offset'];
      String utc_offset_hours=utc_offset.substring(1,3);
      String utc_offset_minutes=utc_offset.substring(4,6);
      now=now.add(Duration(hours: int.parse(utc_offset_hours),minutes: int.parse(utc_offset_minutes)));
      (now.hour) > 6 && (now.hour) <19 ? isDayTime=true : isDayTime = false;
      time=DateFormat.jm().format(now);
    }catch(e){
      print('caught error $e');
      time="Error Getting time";
      isDayTime=true;
    }
  }
}