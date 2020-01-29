import 'package:flutter/material.dart';
import 'package:weather_app/pages/aboutpage.dart';
import 'HttpClient.dart';
import 'Json.dart';
import 'WeatherModel.dart';

void main() => runApp(MainPage());

TextStyle mainTextStyle = TextStyle(color: Colors.white, fontSize: 40);

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainBody(),
    );
  }
}

class MainBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainBodyState();
}

class MainBodyState extends State {
<<<<<<< Updated upstream
=======
  var popupItems = List<PopupMenuEntry>();
  final GlobalKey _mainKey = GlobalKey();
  String _inputText = "";
  WeatherModel currentModel;

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetMainAppBar(context),
      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 270,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                child: Text(
                  "30°C",
                  style: mainTextStyle,
                ),
<<<<<<< Updated upstream
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
              ),
              Padding(
                child: Divider(
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
              ),
              Padding(
                child: Text(
                  "Precipitation: 10%",
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
              ),
              Padding(
                child: Text(
                  "Mostly Sunny",
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.only(left: 20, bottom: 20),
              ),
              Padding(//
                child: TextField(
                  onChanged: (text){
                    GetData(text).then((data) => {ParseJSON(data)});
                  },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(400),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(400),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Enter city name...",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "City",
                        labelStyle: TextStyle(color: Colors.white))),
                padding: EdgeInsets.only(left: 20, right: 20),
              )
            ],
          ),
          Positioned(
            child: RaisedButton(
              child: Text(
                'Refresh',
                style: TextStyle(color: Colors.blue),
              ),
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
            ),
            top: 245,
            left: 100,
            right: 100,
          )
        ],
      ),
    );
=======
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      child: Text(
                        "-°C",
                        style: mainTextStyle,
                      ),
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    ),
                    Padding(
                      child: Divider(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 20, right: 20),
                    ),
                    Padding(
                      child: Text(
                        "Precipitation: -",
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
                    ),
                    Padding(
                      child: Text(
                        "Mostly Sunny",
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                    ),
                    Padding(
                      child: TextField(
                        controller: TextEditingController(text: _inputText),
                        onSubmitted: (text) {
                          GetData(text).then((data) => {
                                this.setState(() {
                                  var newItems = List<PopupMenuEntry>();
                                  _inputText = text;

                                  for (var item in ParseJSON(data).take(5)) {
                                    newItems.add(PopupMenuItem<String>(
                                      child: Text(item),
                                      value: item,
                                    ));
                                    popupItems = newItems;
                                    debugPrint("got $item");
                                  }

                                  //Render the menu
                                  final RenderBox popupButtonObject = _mainKey
                                      .currentContext
                                      .findRenderObject();
                                  final RenderBox overlay = Overlay.of(context)
                                      .context
                                      .findRenderObject();

                                  final RelativeRect position =
                                      RelativeRect.fromRect(
                                          Rect.fromPoints(
                                              popupButtonObject.localToGlobal(
                                                  Offset.zero,
                                                  ancestor: overlay),
                                              popupButtonObject.localToGlobal(
                                                  popupButtonObject.size
                                                      .bottomRight(Offset.zero),
                                                  ancestor: overlay)),
                                          Offset.zero & overlay.size);

                                  showMenu(
                                    context: context,
                                    items: popupItems,
                                    position: position,
                                  ).then((val) {
                                    setState(() {
                                      debugPrint(val);
                                      _inputText = val;
                                    });
                                  });
                                })
                              });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(400),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(400),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "Enter city name...",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "City",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.only(left: 20, right: 20),
                    ),
                  ],
                ),
                Positioned(
                  child: RaisedButton(
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.blue),
                    ),
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      debugPrint('pressed $_inputText');
                      if (_inputText == null) {
                        debugPrint('No input text');
                        return;
                      }

                      GetWeatherData(_inputText).then((data) {
                        if (data == null) {
                          debugPrint("Error occured while retrieving weather");
                          return;
                        }
                        setState(() {
                          currentModel = ParseWeather(data);
                        });
                      });
                    },
                  ),
                  top: 245,
                  left: 100,
                  right: 100,
                ),
                Positioned(
                  child: PopupMenuButton(
                      key: _mainKey,
                      enabled: false,
                      icon: Icon(
                        Icons.menu,
                        color: Theme.of(context).accentColor,
                      ),
                      onSelected: (val) {},
                      itemBuilder: (BuildContext context) {
                        return popupItems;
                      }),
                  top: 225,
                )
              ],
            ),
            Expanded(
                child: Container(
              child: ListView(
                children: CreateWeatherTiles(currentModel),
                padding: EdgeInsets.only(top: 25),
              ),
            ))
          ],
        ));
>>>>>>> Stashed changes
  }
}

List<Widget> CreateWeatherTiles(WeatherModel wModel) {
  var widgets = List<Widget>();
  if (wModel == null) return widgets;

  for (var item in wModel.weatherObjects) {
    var card = ListTile(
      leading: CircleAvatar(
        child: Text(item.temperature.toInt().toString() + "°C"),
      ),
      title: Text(item.weatherTitle),
      subtitle: Text(
          "${item.weatherDescription}\nMax: ${item.temperatureMax}\nMin: ${item.temperatureMin}"),
    );

    widgets.add(card);
    widgets.add(Divider());
  }

  return widgets;
}

AppBar GetMainAppBar(BuildContext context) {
  return AppBar(
    actions: <Widget>[
      PopupMenuButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onSelected: (value) {
            if (value == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return MainPage();
                },
              ));
            }
            if (value == 3) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return AboutPage();
                },
              ));
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text('Main'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Select City'),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('About'),
                  value: 3,
                ),
              ]),
    ],
    title: Row(
      children: <Widget>[
        Icon(Icons.cloud_circle),
        Padding(
          child: Text("Simple Weather Searcher"),
          padding: EdgeInsets.only(left: 10),
        )
      ],
    ),
  );
}
