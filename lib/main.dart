import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'Views/HomeView.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Memory Cards",
      theme: ThemeData(backgroundColor: Colors.white,primarySwatch: Colors.blue),
      darkTheme: ThemeData(backgroundColor: Colors.white,primarySwatch: Colors.blue),
      home: HomeView(),
    );
  }
}
