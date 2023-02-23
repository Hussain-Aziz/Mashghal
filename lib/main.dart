import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaghal/pages/home/main_item_page.dart';
import 'package:mushaghal/pages/items/popular_item_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mushaghal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainItemPage(),
    );
  }
}
