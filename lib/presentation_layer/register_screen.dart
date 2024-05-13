import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.brown,
          primarySwatch: Colors.red,
          hintColor: Colors.blue),
      title: "Login Screen",
      debugShowCheckedModeBanner: false,
      home: SignUpPageUI(),
      );
    
  }
}

class SignUpPageUI extends StatefulWidget {
  const SignUpPageUI({super.key});

  @override
  State<SignUpPageUI> createState() => _SignUpPageUIState();
}

class _SignUpPageUIState extends State<SignUpPageUI> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

