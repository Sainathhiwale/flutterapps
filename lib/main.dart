import 'package:flutter/material.dart';
import 'package:flutterapps/Screen/todo_screen.dart';
import 'package:flutterapps/model/todo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passing Data',
      home: TodosScreen(
        todos: List.generate(
          20,
              (i) =>
              Todo(
                'Todo $i',
                'A description of what needs to be done for Todo $i',
              ),
        ),
      ),
    );
  }
}




