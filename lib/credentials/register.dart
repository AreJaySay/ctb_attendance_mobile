import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:students/credentials/login.dart';
import 'package:students/functions/loaders.dart';
import 'package:students/utils/snackbars/snackbar_message.dart';

import '../services/routes.dart';
import '../utils/palettes/app_colors.dart' hide Colors;
import '../widgets/button.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  final Routes _routes = new Routes();
  final ScreenLoaders _screenLoaders = new ScreenLoaders();
  final SnackbarMessage _snackbarMessage = new SnackbarMessage();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _isPassVisible = false;
  bool _isConfirmPassVisible = false;

  Future _register()async{
    DatabaseReference usersRef = database.ref('mobile_users');
    await usersRef.push().set({
      "name": _name.text,
      "age": _age.text,
      "email": _email.text,
      "phone": _phone.text,
      "password": _pass.text,
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    _age.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          SizedBox(
            height: 70,
          ),
          Center(child: Text("Create New Account",style: TextStyle(fontFamily: "OpenSans",fontWeight: FontWeight.bold, fontSize: 25),)),
          Center(child: Text("Create an account to start explore the app and get started!",style: TextStyle(fontFamily: "OpenSans"),textAlign: TextAlign.center,)),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: _name,
            style: TextStyle(fontFamily: "OpenSans"),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              hintText: 'Name',
              hintStyle: TextStyle(fontFamily: "OpenSans",color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.4)),
              ),
            ),
            onChanged: (text) {

            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _age,
            style: TextStyle(fontFamily: "OpenSans"),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              hintText: 'Age',
              hintStyle: TextStyle(fontFamily: "OpenSans",color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.4)),
              ),
            ),
            onChanged: (text) {

            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _email,
            style: TextStyle(fontFamily: "OpenSans"),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              hintText: 'Email',
              hintStyle: TextStyle(fontFamily: "OpenSans",color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.4)),
              ),
            ),
            onChanged: (text) {

            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _phone,
            style: TextStyle(fontFamily: "OpenSans"),
            keyboardType: TextInputType.number,
            maxLength: 11,
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              hintText: 'Phone number',
              hintStyle: TextStyle(fontFamily: "OpenSans",color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1000),
                borderSide: BorderSide(color: colors.blue.withOpacity(0.4)),
              ),
            ),
            onChanged: (text) {

            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _pass,
            style: TextStyle(fontFamily: "OpenSans"),
            keyboardType: TextInputType.text,
            obscureText: !_isPassVisible,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                hintText: 'Password',
                hintStyle: TextStyle(fontFamily: "OpenSans",color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1000)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: BorderSide(color: colors.blue.withOpacity(0.1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: BorderSide(color: colors.blue.withOpacity(0.4)),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    icon: _isPassVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    onPressed: (){
                      setState(() {
                        _isPassVisible = !_isPassVisible;
                      });
                    },
                  ),
                )
            ),
            onChanged: (text) {

            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _confirmPass,
            style: TextStyle(fontFamily: "OpenSans"),
            keyboardType: TextInputType.text,
            obscureText: !_isConfirmPassVisible,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(fontFamily: "OpenSans",color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1000)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: BorderSide(color: colors.blue.withOpacity(0.1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1000),
                  borderSide: BorderSide(color: colors.blue.withOpacity(0.4)),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    icon: _isConfirmPassVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    onPressed: (){
                      setState(() {
                        _isConfirmPassVisible = !_isConfirmPassVisible;
                      });
                    },
                  ),
                )
            ),
            onChanged: (text) {

            },
          ),
          SizedBox(
            height: 80,
          ),
          materialbutton.materialButton(fontsize: 15,backColor: colors.blue,"REGISTER", (){
            if(_name.text.isEmpty || _age.text.isEmpty || _email.text.isEmpty || _phone.text.isEmpty){
              _snackbarMessage.snackbarMessage(context, message: "All fields are required.", is_error: true);
            }else if(_pass.text != _confirmPass.text){
              _snackbarMessage.snackbarMessage(context, message: "Password and confirm password did not match.", is_error: true);
            }else{
              _screenLoaders.functionLoader(context);
              _register().whenComplete((){
                Navigator.of(context).pop(null);
                _snackbarMessage.snackbarMessage(context, message: "New account successfully created!");
                _routes.navigator_push(context, Login(), transitionType: PageTransitionType.leftToRightWithFade);
              });
            }
          }),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Already have an account?",style: TextStyle(color: Colors.black,fontFamily: "OpenSans"),),
              InkWell(
                onTap: (){
                  _routes.navigator_push(context, Login(), transitionType: PageTransitionType.leftToRightWithFade);
                },
                child: Text(" LOGIN",style: TextStyle(color: colors.blue,fontWeight: FontWeight.bold,fontFamily: "OpenSans"),),
              )
            ],
          )
        ],
      ),
    );
  }
}
