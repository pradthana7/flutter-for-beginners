// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? time;
  String flag; //url to an asset flag icon
  String url;
  bool isDaytime = false;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      final response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offest = data['utc_offset'].substring(1, 3);
      print('Datetime from API: $datetime');
      print('Offset from API: $offest');

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offest)));
      print('Calculated DateTime: $now');

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
      print('isDaytime: $isDaytime');
      print('Formatted Time: $time');
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time date';
    }
  }
}
