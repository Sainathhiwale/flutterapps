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
                        _insert(0,name, miles);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: cars.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == cars.length) {
                      return ElevatedButton(
                        child: Text('Refresh'),
                        onPressed: () {
                          setState(() {
                            _queryAll();
                          });
                        },
                      );
                    }
                    return Container(
                      height: 40,
                      child: Center(
                        child: Text(
                          '[${cars[index].id}] ${cars[index].name} - ${cars[index].miles} miles',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: queryController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car Name',
                        ),
                        onChanged: (text) {
                          if (text.length >= 2) {
                            setState(() {
                              _query(text);
                            });
                          } else {
                            setState(() {
                              carsByName.clear();
                            });
                          }
                        },
                      ),
                      height: 100,
                    ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: carsByName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            margin: EdgeInsets.all(2),
                            child: Center(
                              child: Text(
                                '[${carsByName[index].id}] ${carsByName[index].name} - ${carsByName[index].miles} miles',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: idUpdateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car id',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: nameUpdateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: milesUpdateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car Miles',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Update Car Details'),
                      onPressed: () {
                        int id = int.parse(idUpdateController.text);
                        String name = nameUpdateController.text;
                        int miles = int.parse(milesUpdateController.text);
                        _update(id, name, miles);
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: idDeleteController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car id',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Delete'),
                      onPressed: () {
                        int id = int.parse(idDeleteController.text);
                        _delete(id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  void _insert(index, name,miles) async{
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnId:index,
      DatabaseHelper.columnName:name,
      DatabaseHelper.columnMiles:miles
    };
    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    cars.clear();
    allRows?.forEach((row) => cars.add(Car.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }
  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    carsByName.clear();
    allRows?.forEach((row) => carsByName.add(Car.fromMap(row)));
  }

  void _update(id, name, miles) async {
    // row to update
    Car car = Car(id, name, miles);
    final rowsAffected = await dbHelper.update(car);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold('deleted $rowsDeleted row(s): row $id');
  }
}


