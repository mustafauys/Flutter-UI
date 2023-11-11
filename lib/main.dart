import 'package:blackblu/Data/json.dart';
import 'package:flutter/material.dart';
import 'package:blackblu/colors.dart';
import 'package:http/http.dart' as http;
import 'Data/staticdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlackBlu',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// ÜST BANNER KODLARI BU BÖLÜMDE YER ALIYOR.
//
//
//
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 21, bottom: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "BlackBlu",
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                      Container(
                        width: 22.32,
                        height: 26.26,
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.notifications,
                              color: Colors.blueGrey,
                              size: 30.0,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 9,
                                height: 9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.5),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: redcolor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //
                //
                //
                //
                //ÜST HEADER KODLARI BU BÖLÜMDE YER ALIYOR.
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return Row(
                        children: <Widget>[
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                myList[currentSelectedIndex].isSelected = false;
                                currentSelectedIndex = index;
                                myList[currentSelectedIndex].isSelected = true;
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        myList[index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: myList[index].isSelected
                                                ? Colors.blueGrey
                                                : Colors.black),
                                      ),
                                      myList[index].isSelected
                                          ? Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Container(
                                                  width: 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                ),
                                              ],
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: myList.length,
                    shrinkWrap: true,
                  ),
                ),
                //
                //
                //
                //
                //
                //GÖNDERİ KODLARI BU BÖLÜMDE YER ALIYOR.
                currentSelectedIndex == 0
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                          gonderiler[index].avatar.toString()),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                89 -
                                                8 -
                                                21,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  gonderiler[index]
                                                      .userName
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  gonderiler[index]
                                                      .location
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.more_horiz,
                                            color: Color(0xFF434343),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  gonderiler[index].comment.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Container(
                                    width: 300,
                                    height: 300,
                                    child: FutureBuilder<List<Photo>>(
                                      future: fetchPhotos(http.Client()),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError)
                                          print(snapshot.error);

                                        return snapshot.hasData
                                            ? PhotosList(photos: snapshot.data)
                                            : Center(
                                                child:
                                                    CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "1.7k",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 75,
                                      height: 50,
                                    ),
                                    Icon(
                                      Icons.comment,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "325",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          235,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.reply,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "2.3k",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(width: 25),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            );
                          },
                          itemCount: gonderiler.length,
                        ),
                        //
                        //
                        //
                        //
                        //
                        //HİKAYELER KISMI KODLARI BU BÖLÜMDE YER ALIYOR.
                      )
                    : currentSelectedIndex == 1
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'En Popüler Kullanıcılar',
                                  style: TextStyle(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    height: 179,
                                    child: ListView.builder(
                                      itemBuilder: (context, int index) {
                                        return Row(
                                          children: <Widget>[
                                            Container(
                                              width: 160,
                                              height: 179,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 11.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Image.asset(
                                                        populerkullanici[index]
                                                            .avatar
                                                            .toString()),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      populerkullanici[index]
                                                          .name
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      populerkullanici[index]
                                                          .age
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFFADADAD)),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      width: 107,
                                                      height: 29,
                                                      child: Center(
                                                        child:
                                                            Text('Takip Et '),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: populerkullanici[
                                                                    index]
                                                                .isFemale!
                                                            ? redButtonColor
                                                            : blueButtonColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                            SizedBox(
                                              width: 19,
                                            )
                                          ],
                                        );
                                      },
                                      itemCount: populerkullanici.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Yeni Hikayeler',
                                  style: TextStyle(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 246,
                                  child: ListView.builder(
                                    itemBuilder: (context, int index) {
                                      return Row(
                                        children: <Widget>[
                                          Container(
                                            height: 246,
                                            width: 160,
                                            child: Stack(
                                              children: <Widget>[
                                                Image.asset(
                                                  yenihikaye[index]
                                                      .image
                                                      .toString(),
                                                ),
                                                Image.asset('assets/bg.png'),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 12.0),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10.0),
                                                      child: Container(
                                                        height: 35,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Image.asset(
                                                                yenihikaye[
                                                                        index]
                                                                    .avatar
                                                                    .toString()),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <Widget>[
                                                                Text(
                                                                  yenihikaye[
                                                                          index]
                                                                      .name
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  yenihikaye[
                                                                          index]
                                                                      .postTime
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFFE3E3E3),
                                                                      fontSize:
                                                                          10),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 19,
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount: yenihikaye.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox()
              ],
            ),
          ),
          //
          //
          //
          //
          //
          //BOTTOM NAVBAR KODLARI BU BÖLÜMDE YER ALIYOR.
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    margin: EdgeInsets.only(right: 5, left: 5),
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.blueAccent,
                                      size: 36,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    margin: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 36,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Container(
                                      child: Icon(
                                        Icons.supervised_user_circle,
                                        color: Colors.blue,
                                        size: 36,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
