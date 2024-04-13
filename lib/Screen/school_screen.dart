
import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("School Screen"),
      ),
      body: Center(
        child: Text("School Screen Content"),
      ),
    );
  }
}
