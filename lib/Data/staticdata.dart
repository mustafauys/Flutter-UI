class HomeScreenMenu {
  String name;
  bool isSelected;

  HomeScreenMenu(this.name, this.isSelected);
}

class Gonderi {
  String? avatar;
  String? userName;
  String? location;
  String? comment;
  String? postTime;
  String? image;
  int? likeCount;
  int? commentCount;

  Gonderi(
      {this.avatar,
      this.userName,
      this.location,
      this.comment,
      this.postTime,
      this.image,
      this.likeCount,
      this.commentCount});
}

class Menu {
  String? icon;
  bool? isSelected;
  Menu({this.icon, this.isSelected});
}

class Populer {
  String? avatar;
  String? name;
  String? age;
  bool? isFemale;
  Populer({this.avatar, this.name, this.age, this.isFemale});
}

class Hikaye {
  String? image;
  String? avatar;
  String? name;
  String? postTime;

  Hikaye({this.image, this.avatar, this.name, this.postTime});
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
      userName: "Hatice Özgür",
      location: "Manisa / Akhisar",
      comment:
          "Eskilerden, hayata dair muhteşem bir öğüt; Çok muhabbet tez ayrılık getirir. Bir şeyi az anarsan unutursun, çok anarsan çürütürsün. Bir çiçeği az sularsan kurutursun, çok sularsan çürütürsün.",
      postTime: "2 Saat Önce",
      image: "assets/avatar1.png",
      likeCount: 250,
      commentCount: 100),
  new Gonderi(
      avatar: "assets/avatar2.png",
      userName: "Muhammed Özdemir",
      location: "Elazığ",
      comment:
          "Çehov'un dediği gibi: Bir süreliğine yalnız kalmak tehlikelidir ve bağımlılık yapar. Çünkü ne kadar huzurlu olduğunu görünce artık insanlarla uğraşmak istemezsin.",
      postTime: "4 Saat Önce",
      image: "assets/avatar2.png",
      likeCount: 400,
      commentCount: 100),
  new Gonderi(
      avatar: "assets/avatar3.png",
      userName: "Oğuz Halit Sak",
      location: "Kahramanmaraş",
      comment:
          "Düşünceli olun, çünkü karşılaştığınız herkes inanın en az sizin kadar zorlu bir mücadele veriyor.  diyor Platon. O yüzden bilgi sahibi olmadan, fikir sahibi olmayın.",
      postTime: "6 Saat Önce",
      image: "assets/avatar3.png",
      likeCount: 456,
      commentCount: 132),
  new Gonderi(
      avatar: "assets/avatar4.png",
      userName: "Mustafa Demiray",
      location: "İzmir",
      comment:
          "Vicdanımın rahat olduğu hiçbir konuda açıklama yapma gereği duymam istediğinizi anlamakta özgürsünüz.",
      postTime: "8 Saat Önce",
      image: "assets/avatar4.png",
      likeCount: 300,
      commentCount: 180),
  new Gonderi(
      avatar: "assets/avatar5.png",
      userName: "Simge Fidan",
      location: "Elazığ",
      comment:
          "Eskilerden, hayata dair muhteşem bir öğüt; Çok muhabbet tez ayrılık getirir. Bir şeyi az anarsan unutursun, çok anarsan çürütürsün. Bir çiçeği az sularsan kurutursun, çok sularsan çürütürsün.",
      postTime: "10 Saat Önce",
      image: "assets/avatar5.png",
      likeCount: 500,
      commentCount: 120),
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
      postTime: "1 Saat Önce"),
  new Hikaye(
      avatar: "assets/avatar10.png",
      name: "Hande Güler",
      image: "assets/str2.png",
      postTime: "2 Saat Önce"),
  new Hikaye(
      avatar: "assets/avatar11.png",
      name: "Melike Dönmez",
      image: "assets/str3.png",
      postTime: "14 Saat Önce"),
];
