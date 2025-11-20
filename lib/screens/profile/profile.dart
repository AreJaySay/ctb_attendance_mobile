import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students/credentials/login.dart';
import 'package:students/models/users.dart';
import 'package:students/services/routes.dart';
import 'package:students/utils/palettes/app_colors.dart' hide Colors;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Routes _routes = new Routes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade300,
        elevation: 1,
        centerTitle: true,
        title: Text("Profile",style: TextStyle(fontFamily: "OpenSans", fontSize: 18, fontWeight: FontWeight.w500),),
      ),
      body: StreamBuilder(
        stream: usersModel.loggedUser,
        builder: (context, snapshot) {
          return !snapshot.hasData ?
          Center(
            child: CircularProgressIndicator(),
          ) :
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://dailykar.com/wp-content/uploads/2025/02/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${snapshot.data!["name"]}",style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w600,fontSize: 15),),
                          Text("${snapshot.data!["email"]}",style: TextStyle(fontFamily: "OpenSans",),),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 25,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(colors.blue),
                              ),
                              child: Text("Edit profile", style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),),
                              onPressed: (){},
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(color: Colors.grey.shade200,),
                Spacer(),
                InkWell(
                  onTap: ()async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    print(prefs.getString('email'));
                    usersModel.update(data: []);
                    usersModel.updateUser(data: {});
                    _routes.navigator_pushreplacement(context, Login());
                  },
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: colors.darkblue,),
                        SizedBox(
                          width: 50,
                        ),
                        Text("Logout", style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w600, fontSize: 15),),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(color: Colors.grey.shade200,),
                SizedBox(
                  height: 10,
                ),
                Text("Version 1.0.0",style: TextStyle(fontFamily: "OpenSans", fontSize: 13),),
              ],
            ),
          );
        }
      ),
    );
  }
}
