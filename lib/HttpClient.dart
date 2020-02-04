import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

var _placesURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=";
var _placesURLSecond = "&key=<ADD PLACES KEY HERE>>";

var _weatherURL = "http://api.openweathermap.org/data/2.5/forecast?q=";
var _weahterURLSecond = ",us&mode=json&units=metric&APPID=<ADD APP ID HERE>>";

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