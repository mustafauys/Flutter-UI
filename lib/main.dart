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

class Feeds {
  String avatar;
  // ignore: non_constant_identifier_names
  String user_name;
  String location;
  String comment;
  // ignore: non_constant_identifier_names
  String post_time;
  String image;
  // ignore: non_constant_identifier_names
  int like_count;
  // ignore: non_constant_identifier_names
  int comment_count;

  Feeds(
      {this.avatar,
      // ignore: non_constant_identifier_names
      this.user_name,
      this.location,
      this.comment,
      // ignore: non_constant_identifier_names
      this.post_time,
      this.image,
      // ignore: non_constant_identifier_names
      this.like_count,
      // ignore: non_constant_identifier_names
      this.comment_count});
}

class Menu {
  String icon;
  bool isSelected;
  Menu({this.icon, this.isSelected});
}

class Birthdays {
  String avatar;
  String name;
  String age;
  bool isFemale;
  Birthdays({this.avatar, this.name, this.age, this.isFemale});
}

class Stories {
  String image;
  String avatar;
  String name;
  // ignore: non_constant_identifier_names
  String post_time;

  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  Stories({this.image, this.avatar, this.name, this.post_time});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  int currentPageIndex = 0;
  List<HomeScreenMenu> myList = [
    new HomeScreenMenu("Feed", true),
    new HomeScreenMenu("Stories", false),
    new HomeScreenMenu("IGTV", false),
    new HomeScreenMenu("Events", false),
  ];

  List<Menu> myMenu = [
    new Menu(icon: "assets/home.png", isSelected: true),
    new Menu(icon: "assets/search.png", isSelected: false),
    new Menu(icon: "assets/tab3.png", isSelected: false),
    new Menu(icon: "assets/avatar.png", isSelected: false),
  ];

  List<Feeds> myFeeds = [
    new Feeds(
        avatar: "assets/helen_miles.png",
        user_name: "Helen miles",
        location: "Toronto CA",
        comment:
            "Hi Guys… I’m working on a project about edit \nimages in Adobe Lightroom",
        post_time: "2 Hour Ago",
        image: "assets/hm_1.png",
        like_count: 23000,
        comment_count: 184),
    new Feeds(
        avatar: "assets/john_legend.png",
        user_name: "John Legend",
        location: "Toronto CA",
        comment:
            "Hi Guys… I’m working on a project about edit \nimages in Adobe Lightroom",
        post_time: "2 hour ago",
        image: "assets/hm_1.png",
        like_count: 22000,
        comment_count: 184),
  ];

  List<Birthdays> myBirtdays = [
    new Birthdays(
        avatar: "assets/brt_ali_yasini.png",
        name: "Ali Yasini",
        age: "26 years old",
        isFemale: false),
    new Birthdays(
        avatar: "assets/Niloofar.png",
        name: "Niloofar",
        age: "24 years old",
        isFemale: true),
    new Birthdays(
        avatar: "assets/Niloofar.png",
        name: "Niloofar",
        age: "24 years old",
        isFemale: true),
  ];

  List<Stories> myStories = [
    new Stories(
        avatar: "assets/str_aria_majidi.png",
        name: "Aria majidi",
        image: "assets/str1.png",
        post_time: "2 min ago"),
    new Stories(
        avatar: "assets/str_helen_miles.png",
        name: "Helen miles",
        image: "assets/str2.png",
        post_time: "2 min ago"),
    new Stories(
        avatar: "assets/str_someone.png",
        name: "Aria majidi",
        image: "assets/str3.png",
        post_time: "14 min ago"),
  ];

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
                      Image.asset('assets/logo.png'),
                      Container(
                        width: 22.32,
                        height: 26.26,
                        child: Stack(
                          children: <Widget>[
                            Image.asset('assets/notf.png'),
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
                                                ? redcolor
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
                                                      color: redcolor,
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
                currentSelectedIndex == 0
                    ? Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Image.asset(myFeeds[index].avatar),
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
                                                myFeeds[index].user_name,
                                              ),
                                              Text(
                                                myFeeds[index].location,
                                                style:
                                                    TextStyle(color: greyColor),
                                              )
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
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  myFeeds[index].comment,
                                  style: TextStyle(fontSize: 17.5),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  myFeeds[index].post_time,
                                  style: TextStyle(color: greyColor),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset(myFeeds[index].image),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 42,
                                      height: 42,
                                      child: Center(
                                        child: Image.asset('assets/like.png'),
                                      ),
                                      decoration: BoxDecoration(
                                          color: redTransColor,
                                          borderRadius:
                                              BorderRadius.circular(21)),
                                    ),
                                    Text(
                                      myFeeds[index].like_count > 1000
                                          ? (myFeeds[index].like_count / 1000)
                                                  .toString() +
                                              'K'
                                          : myFeeds[index]
                                              .like_count
                                              .toString(),
                                      style: TextStyle(color: redcolor),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 42,
                                      height: 42,
                                      child: Center(
                                        child:
                                            Image.asset('assets/comment.png'),
                                      ),
                                      decoration: BoxDecoration(
                                          color: blueTransColor,
                                          borderRadius:
                                              BorderRadius.circular(21)),
                                    ),
                                    Text(
                                        myFeeds[index].comment_count > 1000
                                            ? (myFeeds[index].comment_count /
                                                        1000)
                                                    .toString() +
                                                'K'
                                            : myFeeds[index]
                                                .comment_count
                                                .toString(),
                                        style: TextStyle(color: blueColor)),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            );
                          },
                          itemCount: myFeeds.length,
                          shrinkWrap: true,
                        ),
                      )
                    : currentSelectedIndex == 1
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Today’s Birthday',
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
                                                        myBirtdays[index]
                                                            .avatar),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      myBirtdays[index].name,
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      myBirtdays[index].age,
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
                                                        child: Text(
                                                          'Wish ' +
                                                              (myBirtdays[index]
                                                                      .isFemale
                                                                  ? 'Her'
                                                                  : 'Him'),
                                                          style: TextStyle(
                                                              color: myBirtdays[
                                                                          index]
                                                                      .isFemale
                                                                  ? redcolor
                                                                  : blueColor,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: myBirtdays[
                                                                      index]
                                                                  .isFemale
                                                              ? redButtonColor
                                                              : blueButtonColor),
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
                                      itemCount: myBirtdays.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'New Stories',
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
                                                  myStories[index].image,
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
                                                                myStories[index]
                                                                    .avatar),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  myStories[
                                                                          index]
                                                                      .name,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  myStories[
                                                                          index]
                                                                      .post_time,
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
                                          )
                                        ],
                                      );
                                    },
                                    itemCount: myStories.length,
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
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width:
                                (MediaQuery.of(context).size.width / 2) - 30.5,
                            height: 70,
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 0;
                                    });
                                  },
                                  child: MenuItem(
                                    mycontext: context,
                                    icon: 'assets/home.png',
                                    isSelected:
                                        currentPageIndex == 0 ? true : false,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 1;
                                    });
                                  },
                                  child: MenuItem(
                                    mycontext: context,
                                    icon: 'assets/search.png',
                                    isSelected:
                                        currentPageIndex == 1 ? true : false,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 61,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentPageIndex = 2;
                              });
                            },
                            child: MenuItem(
                              mycontext: context,
                              icon: 'assets/tab3.png',
                              isSelected: currentPageIndex == 2 ? true : false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentPageIndex = 3;
                              });
                            },
                            child: MenuItem(
                              mycontext: context,
                              icon: 'assets/avatar.png',
                              isSelected: currentPageIndex == 3 ? true : false,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 61,
                      height: 61,
                      child: Center(
                        child: Image.asset('assets/plus.png'),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: redcolor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-1, 6),
                                blurRadius: 10,
                                color: Color(0xFFF86B68).withOpacity(.36))
                          ]),
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

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  BuildContext mycontext;
  String icon;
  bool isSelected;
  MenuItem({this.mycontext, this.icon, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((MediaQuery.of(mycontext).size.width / 2) - 30.5) / 2,
      height: 70,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(icon),
            SizedBox(
              height: 5,
            ),
            isSelected
                ? Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2)),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
