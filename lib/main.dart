import 'package:flutter/material.dart';
import 'package:homework3/musicPlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Homework3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController searchEditingController = TextEditingController();

  final List<String> _imageUrls = [
    "https://m.media-amazon.com/images/I/51Latad0+-L._AC_.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Bohemian_Rhapsody_by_Queen_US_vinyl_red_label.png/400px-Bohemian_Rhapsody_by_Queen_US_vinyl_red_label.png",
    "https://upload.wikimedia.org/wikipedia/en/thumb/4/44/Single_Ladies_%28Put_a_Ring_on_It%29_cover.png/220px-Single_Ladies_%28Put_a_Ring_on_It%29_cover.png",
    "https://i.scdn.co/image/ab67616d0000b273c5653f9038e42efad2f8a266",
    "https://m.media-amazon.com/images/I/41tHf4NWAyL._AC_SX355_.jpg",
    "https://upload.wikimedia.org/wikipedia/en/c/c6/LivinOnAPrayer%28hq%29.jpg",
  ];
  final List<String> _songTitles = [
    "フェイデッド・ジャパン・EP",
    "Bohemian Rhapsody",
    "Single Ladies",
    "Don’t Stop Believin’",
    "I Write Sins Not Tragedies",
    "Livin’ On A Prayer",
  ];
  final List<String> _vocalNames = [
    "Alan Walker",
    "Queen",
    "Beyonce",
    "Journey",
    "Panic! At The Disco",
    "Bon Jovi",
  ];
  final List<String> _categories = [
    "ポップス",
    "ロック",
    "ブラックミュージック",
    "EDM",
    "ラテン",
    "クラシック",
    "民族音楽",
    "ニューエイジ",
    "インストゥルメンタル",
  ];
  List<Color> categoryColor = [];
  List<Color> _categoryColors(int index) {
    switch(index) {
      case 0:
        categoryColor = const [Color(0xff1f005c), Color(0xff5b0060), Color(0xff870160), Color(0xffac255e), Color(0xffca485c), Color(0xffe16b5c), Color(0xfff39060), Color(0xffffb56b),];
        break;
      case 1:
        categoryColor = const [Color(0xff3f00fe), Color(0xff006aff), Color(0xff0094ff), Color(0xff00b1ff), Color(0xff00cae9), Color(0xff00e0bd), Color(0xff5af1a0), Color(0xffc9ff9d),];
        break;
      case 2:
        categoryColor = const [Color(0xffc3bd00), Color(0xffb4c002), Color(0xffa5c20c), Color(0xff94c518), Color(0xff83c724), Color(0xff6ec830), Color(0xff56ca3c), Color(0xff34cb48),];
        break;
      case 3:
        categoryColor = const [Color(0xff34ff0b), Color(0xff85e800), Color(0xffaed000), Color(0xffccb500), Color(0xffe39700), Color(0xfff37600), Color(0xfffc4f00), Color(0xffff0000),];
        break;
      case 4:
        categoryColor = const [Color(0xff1909ff), Color(0xff7600f2), Color(0xff9f00e5), Color(0xffbd00d9), Color(0xffd400cd), Color(0xffe600c3), Color(0xfff423b9), Color(0xffff3eb2),];
        break;
      case 5:
        categoryColor = const [Color(0xff5aaf60), Color(0xff6ea440), Color(0xff80991e), Color(0xff928b00), Color(0xffa37b00), Color(0xffb36800), Color(0xffc25000), Color(0xffcd2f0f),];
        break;
      case 6:
        categoryColor = const [Color(0xff0622af), Color(0xff7b0c9a), Color(0xffa61284), Color(0xffbe3473), Color(0xffca5569), Color(0xffce756a), Color(0xffce9277), Color(0xffcdac8f),];
        break;
      case 7:
        categoryColor = const [Color(0xff770829), Color(0xff8b003a), Color(0xff9d0050), Color(0xffac006a), Color(0xffb7008a), Color(0xffbb00ad), Color(0xffb512d4), Color(0xffa239fe),];
        break;
      case 8:
        categoryColor = const [Color(0xff1aa704), Color(0xff75a200), Color(0xffa79a00), Color(0xffce8f00), Color(0xffea8537), Color(0xfffd7d5e), Color(0xffff7c84), Color(0xfffe83a8),];
        break;
      default:
        break;
    }
    return categoryColor;
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff444444),
      // extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff444444),
        titleSpacing: 0,
        title: TextField(
          controller: searchEditingController,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white, fontSize: 20,),
          decoration: const InputDecoration(
            fillColor: Color(0xff666666),
            filled: true,
            hintText: 'ホーム',
            hintStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),
            suffixIcon: Icon(Icons.search, color: Colors.white,),
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: <Widget>[
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('あなたへのおすすめ', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
                        Icon(Icons.chevron_right, color: Colors.white,),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(right: 10),
                      itemCount: _imageUrls.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return songImageTile(_imageUrls[index], _songTitles[index], _vocalNames[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10, width: 20,),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('カテゴリー', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
                        Icon(Icons.chevron_right, color: Colors.white,),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          return categoryTile(_categories[index], index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar( // BottomNavigationBarItemに背景色を設定しないと真っ白になるので、背景色の設定を忘れないようにする
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'プレイリスト',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'アカウント',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        // elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xaaffffff),
      ),

    );

  }

  Widget songImageTile(String imageUrl, String songTitle, String vocalName){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){return MusicPlay(imageUrl: imageUrl, songTitle: songTitle, vocalName: vocalName,);}));
        },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl, width: 200, height: 200, fit: BoxFit.cover,),
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(songTitle, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),),
          ),
          Container(
            width: 200,
            child: Text(vocalName, style: const TextStyle(color: Color(0xaaffffff), fontSize: 14,),),
          ),
        ],
      ),
    );
  }

  Widget categoryTile(String category, int index){
    return GestureDetector(
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context){return FullImage(title: 'FullImage', imageUrl: imageUrl);}));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // colors: [
              //   Color(0xff1f005c),
              //   Color(0xff5b0060),
              //   Color(0xff870160),
              //   Color(0xffac255e),
              //   Color(0xffca485c),
              //   Color(0xffe16b5c),
              //   Color(0xfff39060),
              //   Color(0xffffb56b),
              // ],
              colors: _categoryColors(index),
            ),
          ),
          child: Center(
            child: Text(category, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          )
        ),
      ),
    );
  }
}


