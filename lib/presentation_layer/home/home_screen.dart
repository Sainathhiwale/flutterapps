import 'package:flutter/material.dart';
import 'package:flutterapps/domain_layer/repository/user_repository.dart';
import 'package:flutterapps/domain_layer/shared_preferences_service.dart';
import 'package:flutterapps/models/user.dart';
import 'package:flutterapps/presentation_layer/login_screen.dart';

class Home extends StatelessWidget {
  const Home ({super.key});
  static const appTitle = 'Home';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomeScreen(title:appTitle),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required  this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex =0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final userRepository = UserRepository(SharedPreferencesService());
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      "Index 0 User Profile",
      style: optionStyle,
    ),
    Text(
       "Index 1 Logout",
      style: optionStyle,
    ),
    Text(
      "Index 2 Share",
      style: optionStyle,
    ),
    Text(
      "Index 3 Graph",
      style: optionStyle,
    ),
    Text(
      "Index 4 About",
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch(index){
      case 0:

        break;
      case 1:
        userRepository.setIsLoggedIn(false);
        userRepository.clearUser();
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        break;
      case 2:

        break;
      case 3:

        break;

    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), child: Text('sainath'),
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                _onItemTapped(0);
               /* Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );*/
              },
            ),
            Divider(),
            ListTile(
              title: const Text("Logout"),
              onTap: () {
               /* userRepository.clearUser();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );*/
                _onItemTapped(1);
              /*  Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BusinessScreen()),
                );*/
              },
            ),
            Divider(),
            ListTile(
              title: const Text("Share"),
              onTap: (){
                _onItemTapped(2);
               /* Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SchoolScreen()),
                );*/
              },
            ),
            Divider(),
            ListTile(
              title: const Text("Graph"),
              onTap: (){
                _onItemTapped(3);
               /* Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );*/
              },
            ),
            Divider(),
            ListTile(
              title: const Text("About"),
              onTap: (){
                _onItemTapped(4);
               /* Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShareScreen()),
                );*/
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
