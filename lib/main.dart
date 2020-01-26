import 'package:flutter/material.dart';
import 'package:weather_app/pages/aboutpage.dart';
import 'HttpClient.dart';
import 'Json.dart';

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
  }
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
          child: Text("Simple Weather"),
          padding: EdgeInsets.only(left: 10),
        )
      ],
    ),
  );
}
