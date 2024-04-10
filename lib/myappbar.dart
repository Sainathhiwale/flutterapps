import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius:BorderRadius.only(bottomLeft: Radius.circular(80.0))
      ),
      child: Row(),
    );
  }
}