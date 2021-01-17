import 'package:flutter/material.dart';
import 'package:redesign_instagram/colors.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return Container(
                    width: 50,
                    height: 50,
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Text(myList[index].name),
                        myList[index].isSelected
                            ? Column(
                                children: [
                                  SizedBox(height: 6),
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: redcolor,
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                ],
                              )
                            : SizedBox()
                      ],
                    )),
                  );
                },
                itemCount: myList.length,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
