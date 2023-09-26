import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  static const String LOGINKEY = 'login';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:const Center(
          child: Text(
            "Hello",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLogIn = sharedPref.getBool(LOGINKEY);

    Timer(const Duration(seconds: 5), () {
      if (isLogIn != null) {
        if (isLogIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>const HomePage()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>const LoginPage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>const LoginPage()));
      }
    });
  }
}
