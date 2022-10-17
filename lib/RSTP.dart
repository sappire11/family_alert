import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoRSTP extends StatefulWidget {
  const VideoRSTP({Key? key}) : super(key: key);

  @override
  State<VideoRSTP> createState() => _VideoRSTPState();
}

class _VideoRSTPState extends State<VideoRSTP> {
  VlcPlayerController _vlcViewController = new VlcPlayerController.network(
    "rtsp://user:NutcNutc001@163.17.136.146:10008/cam",
    autoPlay: true,

  );
  @override
  Widget build(BuildContext context) {
    //if(mounted)
    // Future.delayed(Duration(seconds: 1) , (){setState(() {

   // });});
    return Column(


      children: [
        if( _vlcViewController.value.playingState == PlayingState.initializing)
          Text("初始化中"),
        if(_vlcViewController.value.playingState == PlayingState.buffering)
          Text("載入中"),
        Container(
          child:
          VlcPlayer(
            controller: _vlcViewController,
            aspectRatio: 16 / 9,
            placeholder: Text("Hello World"),

          ),

        ),
        // Text(_vlcViewController.value.toString()),
        if(_vlcViewController .value.hasError)
          Text(_vlcViewController .value.errorDescription),
        if(_vlcViewController.value.isInitialized)
          IconButton(
            onPressed: (){
              setState(() {
                if (_vlcViewController.value.isPlaying) {
                  _vlcViewController.pause();
                } else {
                  _vlcViewController.play();
                }
              });

            },
            icon: _vlcViewController.value.isPlaying?Icon(Icons.stop_circle_outlined):Icon(Icons.play_circle_outline),
            color: _vlcViewController.value.isPlaying?Colors.black:Colors.red,
            iconSize: 60,),
        if(_vlcViewController.value.hasError)Text("壞了",style: TextStyle(color: Colors.red),)




      ],
    );
  }
}
