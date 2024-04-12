import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Pick a option"),
      ),
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Padding(
             padding: EdgeInsets.all(8),
             child: ElevatedButton(
               onPressed: () {
                 Navigator.pop(context, 'Yep!'); //When a button is tapped, close the selection screen
             },
               child: const Text("Yep!"),
             ),
           ),
           Padding(
             padding: EdgeInsets.all(8),
             child: ElevatedButton(
               onPressed: () {
                 Navigator.pop(context, 'Nope!'); //When a button is tapped, close the selection screen
               },
               child: const Text("Nope!"),
             ),
           ),
         ],
       ),
      ),
    );
  }
}
//https://docs.flutter.dev/cookbook/navigation/returning-data