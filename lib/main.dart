
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
           image: NetworkImage('https://t4.ftcdn.net/jpg/05/47/97/81/360_F_547978128_vqEEUYBr1vcAwfRAqReZXTYtyawpgLcC.jpg'),
         ),
       ),
     ),
    ),
  );
}


