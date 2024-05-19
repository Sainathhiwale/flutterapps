import 'package:flutter/material.dart';
import 'package:flutterapps/models/user.dart';

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

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      "Index 0 Home",
      style: optionStyle,
    ),
    Text(
      "Index 1 Business ",
      style: optionStyle,
    ),
    Text(
      "Index 2 School",
      style: optionStyle,
    ),
    Text(
      "Index 3 User Profile",
      style: optionStyle,
    ),
    Text(
      "Index 4 Share",
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      /*switch(index){
      case 0:
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
        break;
      case 1:
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => BusinessScreen()),
        );
        break;
      case 2:
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => SchoolScreen()),
        );
        break;
      case 3:
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;

    }*/
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
              title: const Text("Home"),
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
              title: const Text("Business"),
              onTap: () {
                _onItemTapped(1);
              /*  Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BusinessScreen()),
                );*/
              },
            ),
            Divider(),
            ListTile(
              title: const Text("School"),
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
              title: const Text("Profile"),
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
              title: const Text("Share"),
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
