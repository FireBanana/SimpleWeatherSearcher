import 'dart:convert';
import 'WeatherModel.dart';
import 'dart:core';

import 'package:flutter/cupertino.dart';

List<String> ParseJSON(String data)
{
  var parsedData = jsonDecode(data);
  List<String> items = <String>[];

  for(dynamic item in parsedData["predictions"])
  {
    items.add(item["description"]);
  }

  return items;
}

WeatherModel ParseWeather(String data)
{
  var parsedData = jsonDecode(data);
  var wModel = WeatherModel();

  wModel.city = parsedData['city']['name'];

  for(dynamic item in parsedData['list'])
  {
    var wObject = WeatherObject();
    var main = item['main'];

    wObject.humidity = main['humidity'];    
    wObject.temperatureFeelsLike = main['feels_like'];
    wObject.temperatureMax = main['temp_max'];
    wObject.temperatureMin = main['temp_min'];
    wObject.temperature = main['temp'];
    wObject.weatherTitle = item['weather'][0]['main'];
    wObject.weatherDescription = item['weather'][0]['description'];
<<<<<<< Updated upstream
=======
    wObject.time = DateTime.parse(item['dt_txt']);
>>>>>>> Stashed changes
    //add icon

    wModel.weatherObjects.add(wObject);
  }

  return wModel;
}