import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade300,
        elevation: 1,
        centerTitle: true,
        title: Text("Search",style: TextStyle(fontFamily: "OpenSans", fontSize: 18, fontWeight: FontWeight.w500),),
      ),
      body: Column(),
    );
  }
}
