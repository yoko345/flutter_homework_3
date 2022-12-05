import 'package:flutter/material.dart';

class MusicPlay extends StatefulWidget {
  const MusicPlay({Key? key, required this.imageUrl, required this.songTitle, required this.vocalName}) : super(key: key);

  final String imageUrl;
  final String songTitle;
  final String vocalName;

  @override
  State<MusicPlay> createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {

  double _value = 0.0;
  bool _toggleMusicPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff444444),
      appBar: AppBar(backgroundColor: const Color(0xff444444),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height/2,
            child: Image.network(widget.imageUrl, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.contain,),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(widget.songTitle, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),),
                ),
                Container(
                  child: Text(widget.vocalName, style: const TextStyle(color: Color(0xaaffffff), fontSize: 14,),),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  child: Slider(
                  min: 0.0,
                  max: 5.0,
                  activeColor: Colors.white,
                  inactiveColor: const Color(0xff666666),
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;  // 左記の式にしないとスライダーが動かない
                    });
                  },
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("0:00", style: TextStyle(color: Color(0xaaffffff), fontSize: 14,),),
                    Text("5:00", style: TextStyle(color: Color(0xaaffffff), fontSize: 14,),),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/3*2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.skip_previous, color: Colors.white, size: 60,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _toggleMusicPlay = !_toggleMusicPlay;
                    });
                  },
                  child: Icon(
                    _toggleMusicPlay?Icons.pause_circle:Icons.play_circle_filled,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                const Icon(Icons.skip_next, color: Colors.white, size: 60,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
