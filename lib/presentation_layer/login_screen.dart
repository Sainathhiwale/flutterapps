import 'package:flutter/material.dart';
import 'package:flutterapps/domain_layer/database_helper.dart';
import 'package:flutterapps/domain_layer/login_repository.dart';

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
      // Login successful, navigate or handle success
    } else {
      // Login failed, show error message
    }

  }
  void showAlert() {
    print("D");
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the user has typed in using our
          // TextEditingController
          title:  Text("Login Screen"),
          content:  Text("Email :" +
              usernameController.text +
              "\nPassword : " +
              passwordController .text),
          actions: <Widget>[
            TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text('Ok'),
                onPressed: () {
                  usernameController.clear();
                  passwordController .clear();
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }


}