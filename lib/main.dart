import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int num =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Count App") ,
          centerTitle :true,
      ),
      body: Center(
       child: Text("the count is :$num"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            num++;
          });
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}

