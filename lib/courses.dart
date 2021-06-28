import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:chewie/chewie.dart';
import 'package:videocourseapp/chewieListItem.dart';

import 'main.dart';

class Courses extends StatefulWidget {

  int sessionNo;

  Courses(this.sessionNo);

  @override
  _CoursesState createState() => _CoursesState(sessionNo);
}

class _CoursesState extends State<Courses> {

  late VideoPlayerController videoController;
  List downloadUrl=[];
  bool dataRetrieved=false;
  int sessionNo;
  List beginnerList=['Java - Session 01 - Introduction to Java','Java - Session 02 - Java History','Java - Session 03 - Java Features','Java - Session 04 - Java Installation','Java - Session 05 - Java Hello World'];
  List intermediateList=['Java - Session 06 - Java Hello World','Java - Session 07 - Java OOP concepts','Java - Session 08 - Java Classes','Java - Session 09 - Java Inheritance','Java - Session 10 - Java Friend function'];


  _CoursesState(this.sessionNo);

  @override
  void initState() {
    getDownloadUrl();
    super.initState();
  }

  getDownloadUrl() async{
    var result=await FirebaseStorage.instance.ref('videos/').listAll();
    result.items.forEach((res) async{
      res.getDownloadURL().then((r){
        setState(() {
          downloadUrl.add(r.toString());
          if(downloadUrl.length==result.items.length){
            dataRetrieved=true;
          }
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    print(downloadUrl);
    return dataRetrieved?Container(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: ChewieListItem(VideoPlayerController.network(downloadUrl[sessionNo]), true),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: beginnerList.length+intermediateList.length,
              itemBuilder: (context,i){
                if(i==0 || i==beginnerList.length){
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(i==0?"Beginner Module":"Intermediate Module:"),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Container(color: Colors.grey,height: 60,width: 5,),
                          Container(color: Colors.grey,width:15,height:4),
                          SizedBox(
                            width: 320,
                            child: GestureDetector(
                              onTap:(){
                                setState(() {
                                  sessionNo=i;
                                });
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp(0,sessionNo)));
                              },
                              child: Card(
                                elevation: 5,
                                child: Row(
                                  children: [
                                    Container(color: Colors.green,width: 4,height: 40,),
                                    SizedBox(width: 10,),
                                    Text(i==0?beginnerList[i]:intermediateList[0]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        i==(beginnerList.length+intermediateList.length-1)?Container(color: Colors.grey,height: 30,width: 5,):Container(color: Colors.grey,height: 60,width: 5,),
                        i==(beginnerList.length+intermediateList.length-1)?SizedBox(height: 25,):SizedBox(),
                      ],
                    ),
                    Container(color: Colors.grey,width:15,height:4),
                    SizedBox(
                      width: 320,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            sessionNo=i;
                          });
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp(0,sessionNo)));
                        },
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              Container(color: Colors.green,width: 4,height: 40,),
                              SizedBox(width: 10,),
                              Text(i<beginnerList.length?beginnerList[i]:intermediateList[i-beginnerList.length]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      //) : Container(),
    ):Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Loading..."),
          )
        ],
      ),
    );
  }
}
