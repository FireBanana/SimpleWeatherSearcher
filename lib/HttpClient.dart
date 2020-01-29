import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

var _placesURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=";
var _placesURLSecond = "&key=AIzaSyB6wGhhqbwLE7SRokUyx_EKW_SqX1r4jGU";

var _weatherURL = "http://api.openweathermap.org/data/2.5/forecast?q=";
var _weahterURLSecond = ",us&mode=json&units=metric&APPID=f715c12690836a20574ac87280084005";

Future<String> GetData(String city) async 
{
  var response = await http.get(_placesURL + city + _placesURLSecond);
  return response.body.toString();
}

Future<String> GetWeatherData(String city) async
{
  var response = await http.get(_weatherURL + city + _weahterURLSecond);
  if(response.statusCode != 200)
    return null;
    
  return response.body.toString();
}