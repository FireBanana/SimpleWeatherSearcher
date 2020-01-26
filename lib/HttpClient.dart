import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

var _placesURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=";
var _placesURLSecond = "&key=AIzaSyB6wGhhqbwLE7SRokUyx_EKW_SqX1r4jGU";

Future<String> GetData(String city) async 
{
  var response = await http.get(_placesURL + city + _placesURLSecond);
  return response.body.toString();
}
