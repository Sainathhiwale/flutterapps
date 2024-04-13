import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share Screen"),
      ),
      body: Center(
        child: Text("Share Screen content"),
      ),
    );
  }
}
