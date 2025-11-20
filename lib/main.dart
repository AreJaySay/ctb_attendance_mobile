import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students/credentials/login.dart';
import 'package:students/screens/landing.dart';
import 'package:students/services/apis/users.dart';
import 'package:students/services/routes.dart';
import 'package:students/utils/palettes/app_colors.dart' hide Colors;
import 'package:firebase_database/firebase_database.dart';
import 'models/users.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library book borrow - students',
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      locale: const Locale('en', 'EN'),
      supportedLocales: [
        Locale('en', 'EN'),
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UsersApi _usersApi = new UsersApi();
  final Routes _routes = new Routes();

  @override
  void initState() {
    // TODO: implement initState
      _usersApi.getUsers().whenComplete(()async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Future.delayed(Duration(seconds: 5), ()async {
          List _user = usersModel.value.where((s) => s["email"] == prefs.getString('email') && s["pass"] == prefs.getString('pass')).toList();
          print("GET CURRENT USER ${_user}");
          if(_user.isNotEmpty){
            usersModel.updateUser(data: _user.first);
            _routes.navigator_pushreplacement(context, Landing());
          }else{
            _routes.navigator_pushreplacement(context, Login());
          }
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 130,
              height: 130,
              image: AssetImage("assets/logos/main_logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
