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
  String user_name;
  String location;
  String comment;
  String post_time;
  String image;
  int like_count;
  int comment_count;

  Feeds(
      {this.avatar,
      this.user_name,
      this.location,
      this.comment,
      this.post_time,
      this.image,
      this.like_count,
      this.comment_count});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  List<HomeScreenMenu> myList = [
    new HomeScreenMenu("Feed", true),
    new HomeScreenMenu("Strories", false),
    new HomeScreenMenu("IGTV", false),
    new HomeScreenMenu("Events", false),
  ];

  List<Feeds> myFeeds = [
    new Feeds(
        avatar: "assets/helen_miles.png",
        user_name: "Helen Miles",
        location: "Toronta CA",
        comment:
            "Hi Guys... I'm working on a project about edit \nimages in Adobe Lightroom",
        post_time: "3 hour ago",
        image: "assets/hm_1.png",
        like_count: 230000,
        comment_count: 184),
    new Feeds(
        avatar: "assets/john_legend.png",
        user_name: "John Legend",
        location: "Toronta CA",
        comment:
            "Hi Guys... I'm working on a project about edit \nimages in Adobe Lightroom",
        post_time: "3 hour ago",
        image: "assets/hm_1.png",
        like_count: 230000,
        comment_count: 184),
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
            SizedBox(height: 10),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return Row(
                    children: [
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
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                            ],
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                    ],
                  );
                },
                itemCount: myList.length,
                shrinkWrap: true,
              ),
            ),
            Expanded(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    89 -
                                    8 -
                                    21,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myFeeds[index].user_name,
                                    ),
                                    Text(
                                      myFeeds[index].location,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.more_horiz)
                            ],
                          ),
                        ],
                      ),
                      Text(myFeeds[index].comment),
                      Text(myFeeds[index].post_time),
                      Image.asset(myFeeds[index].image),
                      Row(children: <Widget>[
                        Container(
                          width: 42,
                          height: 42,
                          child: Center(
                            child: Image.asset('assets/like.png'),
                          ),
                          decoration: BoxDecoration(
                            color: redTransColor,
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                        Text(myFeeds[index].like_count > 1000
                            ? (myFeeds[index].like_count / 1000).toString() +
                                'K'
                            : myFeeds[index].like_count.toString()),
                        SizedBox(width: 5),
                        Container(
                          width: 42,
                          height: 42,
                          child: Center(
                            child: Image.asset('assets/comment.png'),
                          ),
                          decoration: BoxDecoration(
                            color: blueTransColor,
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                        Text(myFeeds[index].comment_count > 1000
                            ? (myFeeds[index].comment_count / 1000).toString() +
                                'K'
                            : myFeeds[index].comment_count.toString()),
                      ])
                    ],
                  );
                },
                itemCount: myFeeds.length,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
