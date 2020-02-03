<<<<<<< Updated upstream
=======
import 'dart:core';

>>>>>>> Stashed changes
class WeatherModel
{
  String city;
  List<WeatherObject> weatherObjects = new List<WeatherObject>();
}

class WeatherObject
{
  num temperature;
  num temperatureFeelsLike;
  num temperatureMin, temperatureMax;
  int humidity;
  String weatherTitle, weatherDescription;
<<<<<<< Updated upstream
=======
  DateTime time;
>>>>>>> Stashed changes
}