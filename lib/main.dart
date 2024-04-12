import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapps/Screen/second_route.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Basics',
      home: FirstRoute(),
    );
  }
}
class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("First Route"),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const SecondRoute()),
            );
          },
          child: const Text("Open Route"),
        ),
      ),
    );
  }
}








