import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  late String time;
  // late String flag;
  String url;

  WorldTime({required this.location, required this.url});

  Future<void> getData() async {
    try {
      Uri uri = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      Response response = await get(uri);
      Map data = await jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(dateTime);
      print(offset);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      // DateTime now2 = now.add(const Duration(days: 5));
      time = now.toString();
    } catch (err) {
      print("The error is : $err");
      time = "Sorry Could Not Fetch Time";
    }
  }
}
