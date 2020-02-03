import 'package:flutter/material.dart';

import '../main.dart';

class AboutPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetMainAppBar(context),
      body: Text('Made by Owais Akhtar'),
    );
  }
  
}