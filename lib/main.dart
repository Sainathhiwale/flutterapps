import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabControllerDemo(),
    );
  }
}

class TabControllerDemo extends StatelessWidget {
  const TabControllerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car),),
                Tab(icon: Icon(Icons.directions_transit),),
                Tab(icon: Icon(Icons.directions_bike),)
              ],
            ),
            title: const Text('Tab Demo'),
          ),
          body: TabBarView(
            children: [
             // Icon(Icons.directions_car),
              CarList(),
              TrainNameList(),
              BikeList(),
            ],
          ),
        ),
      ),
    );
  }
}

class CarList extends StatelessWidget {
   CarList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carData.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(carData[index]),
        );
      },
    );
  }
  // Sample car data
  final List<String> carData = [
    'Toyota',
    'Honda',
    'Ford',
    'Chevrolet',
    'BMW',
    'Mercedes-Benz',
    'Audi',
    'Volkswagen',
    'Tesla',
    'Nissan',
  ];
}

class TrainNameList extends StatelessWidget {
   TrainNameList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trainsList.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(trainsList[index]),
        );
      },
    );
  }
  final List<String> trainsList = [
    "Abohar Jodhpur Express",
    "Agartala Mumbai LTT AC Super Fast Express",
    "Agartala Rani Kamlapati Special",
    "Agra Cantt Ahmedabad Super Fast ",
    "Agartala Mumbai LTT AC Super Fast Express"
    "Sabarmati Daulatpur Chowk Express",
    "Sabarmati Shri Mata Vaishno Devi Katra Express",
    "Sabroom Agartala DEMU Special",
    "Sadulpur Hanumangarh Passenger Special",
    "Raxaul Howrah Express",
    "Raxaul Hyderabad Weekly Express",
    "Puri Gunupur Express",
    "Pune Danapur Super Fast Summer Special",
    "New Delhi Rani Kamlapati Shatabdi Express",
    "New Delhi - Amritsar Swarna Jayanti Shatabdi Express",
    "Nangal Dam Ambala Cantonmentmemu Express Special",
    "Nanjangud - Mysuru Express Special",
  ];
}

class BikeList extends StatelessWidget {
   BikeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bikeList.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(bikeList[index]),
        );
      },
    );
  }
  final List<String> bikeList = [
   "Hero Splendor Plus",
   "TVS Raider 125 ",
   "TVS Apache RTR 160 4V",
   "Yamaha MT 15 ",
   "Yamaha FZS Fi V4",
   "Yamaha R15 V4",
    "Bajaj Pulsar NS200",
    "Royal Enfield",
    "Yamaha",
    "Honda Activa 6G",
    "Ampere NXG",
    "Jawa 350",
    "Honda NX500",
    "Royal Enfield Shotgun 650",
    "Hero Xtreme 125R",

  ];
}



//https://docs.flutter.dev/cookbook/design/tabs


