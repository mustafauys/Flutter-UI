import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redesign Instagram',
      home: HomeScreen(),
    );
  }
}

class HomeScreenMenu {
  String name;
  bool isSelected;

  HomeScreenMenu(this.name, this.isSelected);
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<HomeScreenMenu> myList = [
    new HomeScreenMenu("Feed", true),
    new HomeScreenMenu("Strories", false),
    new HomeScreenMenu("IGTV", false),
    new HomeScreenMenu("Events", false),
  ];
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 21),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.only(right: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/logo.png'),
                    Image.asset('assets/notf.png'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

