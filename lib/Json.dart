import 'dart:convert';

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