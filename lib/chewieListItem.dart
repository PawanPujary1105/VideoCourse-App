import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class ChewieListItem extends StatefulWidget {

  VideoPlayerController videoController;
  bool looping;

  ChewieListItem(this.videoController,this.looping);

  @override
  _ChewieListItemState createState() => _ChewieListItemState(videoController,looping);
}

class _ChewieListItemState extends State<ChewieListItem> {

  VideoPlayerController videoController;
  late ChewieController chewController;
  bool looping;

  _ChewieListItemState(this.videoController,this.looping);

  @override
  void initState() {
    chewController=ChewieController(
      videoPlayerController: videoController,
      aspectRatio: 16/9,
      autoInitialize: true,
      looping: looping,
      errorBuilder: (context,err){
        return Center(
          child: Text(err,style: TextStyle(color: Colors.white),),
        );
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    chewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("chewie");
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Chewie(
        controller: chewController,
      ),
    );
  }
}
