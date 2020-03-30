import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:credit_car_challenge/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credit Card Challenge',
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        create: (_) => PageControllerApp(),
        child: HomePage(),
      ),
    );
  }
}
