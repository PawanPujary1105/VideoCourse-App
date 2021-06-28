import 'package:flutter/material.dart';

class Invite extends StatefulWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Invite"),
      ),
    );
  }
}
