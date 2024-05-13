import 'package:flutter/material.dart';
import 'package:flutterapps/domain_layer/database_helper.dart';
import 'package:flutterapps/domain_layer/login_repository.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  bool _obscurePassword = true;

  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final loginRepository = LoginRepository(databaseHelper: DatabaseHelper());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 35),
              TextFormField(
                controller: _controllerUsername,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "User Name",
                  prefixIcon: const Icon(Icons.person_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter User Name!';
                  }else{
                    return "Username is already registered.";
                  }
                  return null;
                },
                onEditingComplete: ()=>_focusNodeEmail.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter the Email Address!';
                  }else if(!value.contains('@') && value.contains('.')){
                    return 'Invalid Email';
                  }
                  return null;
                },
                onEditingComplete: ()=> _focusNodePassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 character.";
                  }
                  return null;
                },
              ),
            ],
          ),
         ),
        )
    );
  }
}

