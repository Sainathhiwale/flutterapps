import 'package:flutter/material.dart';
import 'package:flutterapps/myappbar.dart';
import 'package:flutterapps/profile.dart';
void main(){
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  Profile(),
                  MyAppBar(),
                ],
              )
            ],
          ),
        ),
      ),
      );

  }
}
