class HomeScreenMenu {
  String name;
  bool isSelected;

  HomeScreenMenu(this.name, this.isSelected);
}

class Gonderi {
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

  Gonderi(
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

class Populer {
  String avatar;
  String name;
  String age;
  bool isFemale;
  Populer({this.avatar, this.name, this.age, this.isFemale});
}

class Hikaye {
  String image;
  String avatar;
  String name;
  // ignore: non_constant_identifier_names
  String post_time;

  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  Hikaye({this.image, this.avatar, this.name, this.post_time});
}

int currentSelectedIndex = 0;
int currentPageIndex = 0;
List<HomeScreenMenu> myList = [
  new HomeScreenMenu("Anasayfa", true),
  new HomeScreenMenu("Hikayeler", false),
  new HomeScreenMenu("Keşfet", false),
  new HomeScreenMenu("Profil", false),
];

List<Gonderi> gonderiler = [
  new Gonderi(
      avatar: "assets/avatar1.png",
      user_name: "Hatice Özgür",
      location: "Manisa / Akhisar",
      comment:
          "Eskilerden, hayata dair muhteşem bir öğüt; Çok muhabbet tez ayrılık getirir. Bir şeyi az anarsan unutursun, çok anarsan çürütürsün. Bir çiçeği az sularsan kurutursun, çok sularsan çürütürsün.",
      post_time: "2 Saat Önce",
      image: "assets/avatar1.png",
      like_count: 250,
      comment_count: 100),
  new Gonderi(
      avatar: "assets/avatar2.png",
      user_name: "Muhammed Özdemir",
      location: "Elazığ",
      comment:
          "Çehov'un dediği gibi: Bir süreliğine yalnız kalmak tehlikelidir ve bağımlılık yapar. Çünkü ne kadar huzurlu olduğunu görünce artık insanlarla uğraşmak istemezsin.",
      post_time: "4 Saat Önce",
      image: "assets/avatar2.png",
      like_count: 400,
      comment_count: 100),
  new Gonderi(
      avatar: "assets/avatar3.png",
      user_name: "Oğuz Halit Sak",
      location: "Kahramanmaraş",
      comment:
          "Düşünceli olun, çünkü karşılaştığınız herkes inanın en az sizin kadar zorlu bir mücadele veriyor.  diyor Platon. O yüzden bilgi sahibi olmadan, fikir sahibi olmayın.",
      post_time: "6 Saat Önce",
      image: "assets/avatar3.png",
      like_count: 456,
      comment_count: 132),
  new Gonderi(
      avatar: "assets/avatar4.png",
      user_name: "Mustafa Demiray",
      location: "İzmir",
      comment:
          "Vicdanımın rahat olduğu hiçbir konuda açıklama yapma gereği duymam istediğinizi anlamakta özgürsünüz.",
      post_time: "8 Saat Önce",
      image: "assets/avatar4.png",
      like_count: 300,
      comment_count: 180),
  new Gonderi(
      avatar: "assets/avatar5.png",
      user_name: "Simge Fidan",
      location: "Elazığ",
      comment:
          "Eskilerden, hayata dair muhteşem bir öğüt; Çok muhabbet tez ayrılık getirir. Bir şeyi az anarsan unutursun, çok anarsan çürütürsün. Bir çiçeği az sularsan kurutursun, çok sularsan çürütürsün.",
      post_time: "10 Saat Önce",
      image: "assets/avatar5.png",
      like_count: 500,
      comment_count: 120),
];

List<Populer> populerkullanici = [
  new Populer(
      avatar: "assets/avatar7.png",
      name: "Melis Düzen",
      age: "24 Yaşında",
      isFemale: true),
  new Populer(
      avatar: "assets/avatar6.png",
      name: "Mehmet Dursun",
      age: "25 Yaşında",
      isFemale: false),
  new Populer(
      avatar: "assets/avatar8.png",
      name: "Esra Çelik",
      age: "22 Yaşında",
      isFemale: true),
];

List<Hikaye> yenihikaye = [
  new Hikaye(
      avatar: "assets/avatar9.png",
      name: "Zeki Çelik",
      image: "assets/str1.png",
      post_time: "1 Saat Önce"),
  new Hikaye(
      avatar: "assets/avatar10.png",
      name: "Hande Güler",
      image: "assets/str2.png",
      post_time: "2 Saat Önce"),
  new Hikaye(
      avatar: "assets/avatar11.png",
      name: "Melike Dönmez",
      image: "assets/str3.png",
      post_time: "14 Saat Önce"),
];
