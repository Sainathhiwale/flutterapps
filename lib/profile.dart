import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
          color: Color(0xffe3e3e3),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0))
      ),
    );
  }
}

