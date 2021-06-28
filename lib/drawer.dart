import 'package:flutter/material.dart';
import 'package:videocourseapp/main.dart';

class NavDrawer extends StatefulWidget {

  int screen;

  NavDrawer(this.screen);

  @override
  _NavDrawerState createState() => _NavDrawerState(screen);
}

class _NavDrawerState extends State<NavDrawer> {

  var pressColor=Colors.white,pressColor1=Colors.white,pressColor2=Colors.white;
  int screen;

  _NavDrawerState(this.screen);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.75,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 50,),
          Row(
            children: [
              SizedBox(width: 20,),
              CircleAvatar(
                maxRadius: 30,
                minRadius: 5,
                child: Image.asset('assets/images.png',height: 50,),
              ),
              SizedBox(width: 20,),
              Text("User1199",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 2,
              color: Colors.grey,
            ),
          ),
          Container(
            color: screen==0?Colors.grey:pressColor,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  pressColor=Colors.grey;
                });
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyApp(0,0)), (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Icon(Icons.library_books),
                    SizedBox(width: 20,),
                    Text("Courses",style: TextStyle(fontStyle:FontStyle.italic,fontSize: 16),),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            color: screen==1?Colors.grey:pressColor1,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  pressColor1=Colors.grey;
                });
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyApp(1,0)), (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Icon(Icons.people),
                    SizedBox(width: 20,),
                    Text("Invite Friends",style: TextStyle(fontStyle:FontStyle.italic,fontSize: 16),),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            color: screen==2?Colors.grey:pressColor2,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  pressColor2=Colors.grey;
                });
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MyApp(2,0)), (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Icon(Icons.help),
                    SizedBox(width: 20,),
                    Text("Contact Us",style: TextStyle(fontStyle:FontStyle.italic,fontSize: 16),),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
