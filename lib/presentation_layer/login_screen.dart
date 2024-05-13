import 'package:flutter/material.dart';
import 'package:flutterapps/Utils/app_log.dart';
import 'package:flutterapps/domain_layer/database_helper.dart';
import 'package:flutterapps/domain_layer/login_repository.dart';
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
  final FocusNode _passwordFocusNode = new FocusNode();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginRepository = LoginRepository(databaseHelper: DatabaseHelper());


  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 110.0, 30, 20),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/24228143?s=400&u=22907cb59a096c2d8d473626323bb210cd986b1e&v=4"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      autofocus: true,
                      controller: usernameController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration:
                      InputDecoration(labelText: 'Enter your email id'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                        focusNode: _passwordFocusNode,
                        controller: passwordController ,
                        textInputAction: TextInputAction.done,
                        decoration:
                        InputDecoration(labelText: 'Enter your password'),
                        keyboardType: TextInputType.text,
                        obscureText: true),
                  ],
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0)),
                ButtonTheme(
                  minWidth: double.maxFinite,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: _handleLogin,
                      child: new Text(
                        "Login",
                        style:
                        new TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Container(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: _handleRegister,
                    child: new Text("Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _handleLogin() async {
    final username = usernameController.text;
    final password = passwordController.text;
    int index =0;
    final user = await loginRepository.login(index,username, password);
    if (user != null) {
      AppLog().d("login", 'user is found');
      // Login successful, navigate or handle success
    } else {
      AppLog().d("login", 'user is not found');
      Fluttertoast.showToast(msg: "User does not exits Please Sign up..",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
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
}