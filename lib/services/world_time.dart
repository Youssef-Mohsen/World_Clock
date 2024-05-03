import 'package:http/http.dart';
import 'dart:convert';
import'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time = "";
  late String flag;
  late String url;
  late bool isDayTime;
  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async{

    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    //
    late String datatime = data['utc_datetime'];
    late String offset = data['utc_offset'].toString().substring(2,3);

    //
    DateTime now = DateTime.parse(datatime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDayTime = now.hour>6&&now.hour<20 ? true:false;
    time =DateFormat.jm().format(now);

  }
}