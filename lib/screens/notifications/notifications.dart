import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade300,
        elevation: 1,
        centerTitle: true,
        title: Text("Notifications",style: TextStyle(fontFamily: "OpenSans", fontSize: 18, fontWeight: FontWeight.w500),),
      ),
      body: Column(),
    );
  }
}
