import 'package:flutter/material.dart';
import 'package:flutterapps/db/databaseHelper.dart';
import 'package:flutterapps/model/car.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Examen Flutter Database",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;
  List<Car> cars = [];
  List<Car> carsByName = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

 //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController milesUpdateController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab( text: "Insert",),
                Tab( text: "View",),
                Tab( text: "Query",),
                Tab( text: "Update",),
                Tab( text: "Delete",),
              ],
            ),
            title: Text('Examen - Flutter SQLite example'),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  children:<Widget> [
                   Container(
                     padding: EdgeInsets.all(15),
                     child: TextField(
                       controller: nameController,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Car Name',
                       ),
                     ),
                   ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: milesController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Car Miles"
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Insert Car Details'),
                      onPressed: () {
                        String name = nameController.text;
                        int miles = int.parse(milesController.text);
                        _insert(name, miles);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

  void _insert(name,miles) async{
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName:name,
      DatabaseHelper.columnMiles:miles
    };
    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }
}
