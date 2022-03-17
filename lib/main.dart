import 'package:flutter/material.dart';

import 'news_module/views/news_list_view.dart';
// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEWS APP',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:  NewsDashboardPage (),
    );
  }
}

