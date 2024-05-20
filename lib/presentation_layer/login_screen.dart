import 'package:flutter/material.dart';
import 'package:flutterapps/Utils/app_log.dart';
import 'package:flutterapps/domain_layer/database_helper.dart';
import 'package:flutterapps/domain_layer/repository/login_repository.dart';
import 'package:flutterapps/domain_layer/repository/user_repository.dart';
import 'package:flutterapps/domain_layer/shared_preferences_service.dart';
import 'package:flutterapps/presentation_layer/home/home_screen.dart';
import 'package:flutterapps/presentation_layer/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.brown,
          primarySwatch: Colors.red,
          hintColor: Colors.blue),
      title: "Login Screen",
      home: LoginPageUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPageUI extends StatefulWidget {
  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  late BuildContext context;
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controlleruserEmail= TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
   String message ='';

  bool _obscurePassword = true;
  final loginRepository = LoginRepository(databaseHelper: DatabaseHelper());
  final userRepository =  UserRepository(SharedPreferencesService());

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(
                "Welcome back",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Login to your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 60),
              TextFormField(
                controller: _controlleruserEmail,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onEditingComplete: () => _focusNodePassword.requestFocus(),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter username.";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
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
                  }

                  return null;
                },
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final useremail = _controlleruserEmail.text;
                        final password = _controllerPassword.text;
                        final user = await loginRepository.login(useremail, password);
                        if (user != null) {
                          message = user.username;
                          print(user.useremail);
                          print(user.password);
                          print(user.id);
                          await userRepository.saveUser(user);
                          userRepository.setIsLoggedIn(true);
                          AppLog().d("login", 'user is found');
                          // Login successful, navigate home screen
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        } else {
                          AppLog().d("login", 'user is not found');
                          Fluttertoast.showToast(msg: "UInvalid username or password.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      }
                    },
                    child: const Text("Login"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            ),
                          );
                        },
                        child: const Text("Signup"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkLoginStatus(); // Check on initialization
    super.initState();

  }

  void _checkLoginStatus() async{
    final isLoggedIn = await userRepository.getIsLoggedIn();

    if (isLoggedIn) {
      // Navigate to Home Screen if already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  // navigate to sign up screen
  void _handleRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }
  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controlleruserEmail.dispose();
    _controllerPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}