
import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business"),
      ),
      body: Center(
        child: Text("Business Screen content"),
      ),
    );
  }
}
