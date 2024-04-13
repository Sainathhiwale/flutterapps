import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = 'Network Image ';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyApp.appTitle,
      home: ImageScreen(),
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Image"),
      ),
      body: Image.network("https://picsum.photos/250?image=9"),
    );
  }
}





