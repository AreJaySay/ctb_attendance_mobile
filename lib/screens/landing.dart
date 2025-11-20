import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:students/screens/notifications/notifications.dart';
import 'package:students/screens/profile/profile.dart';
import 'package:students/screens/reports/reports.dart';
import 'package:students/screens/search/search.dart';
import 'package:students/services/routes.dart';
import 'package:students/utils/palettes/app_colors.dart' hide Colors;
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../models/users.dart';
import 'attendances/attendances.dart';

class Landing extends StatefulWidget {
  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final Routes _routes = new Routes();
  final _controller = PageController();
  int _selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.grey.shade50,
          leading: Center(
            child: SizedBox(
              width: 35,
              height: 35,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/logos/main_logo.png"),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                _routes.navigator_push(context, Search());
              },
            ),
            IconButton(
              icon: Badge(child: Icon(Icons.notifications_none), label: Text("2"),),
              onPressed: (){
                _routes.navigator_push(context, Notifications());
              },
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: (){
                _routes.navigator_push(context, Profile());
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("https://dailykar.com/wp-content/uploads/2025/02/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg"),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index){
          print(_controller.page!.toInt());
        },
        children: [
          Attendances(),
          Reports()
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconStyle: IconStyle.animated,
        ),
        items: [
          BottomBarItem(
            icon: Icon(Icons.today_outlined,size: 28,),
            title: const Text('Attendances',style: TextStyle(fontFamily: "OpenSans"),),
            backgroundColor: colors.blue,
            selectedIcon: Icon(Icons.today),
          ),
          BottomBarItem(
            icon: Icon(Icons.folder_outlined,size: 28,),
            title: const Text('Reports',style: TextStyle(fontFamily: "OpenSans"),),
            backgroundColor: colors.blue,
            selectedIcon: Icon(Icons.folder),
          ),
        ],
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        currentIndex: _selected,
        onTap: (index) {
          setState(() {
            _selected = index;
            _controller.jumpToPage(index);
          });
        },
      )
    );
  }
}
