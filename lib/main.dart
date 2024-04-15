
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Scaffold(
       backgroundColor: Colors.blueGrey,
       appBar: AppBar(
         centerTitle: true,
         title: Text('Image demo'),
         backgroundColor: Colors.pink[900],
       ),
       body:Center(
         child: Image(
           alignment:Alignment.center ,
           image: AssetImage('images/diamond.png'),
         ),
       ),
     ),
    ),
  );
}


