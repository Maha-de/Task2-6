import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_3/pages/homepage.pages.dart';
import 'package:task_3/pages/login.pages.dart';
import 'package:task_3/pages/sign_up.pages.dart';
import 'package:task_3/services/preferences.services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.png"),
                        fit: BoxFit.cover))),
            Padding(
                padding: const EdgeInsets.fromLTRB(80, 140, 10, 20),
                child: Container(
                height: 250, width: 250,
                decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/logo3.png",),)
                ),
                ),
                ),

                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 260, 10, 20),
                    child: Center(
                      child: ListView(children: [
                        SizedBox(height: 60),
                        Center(
                          child: Text("Cooking Done The Easy Way",
                              style: TextStyle(
                                color: Colors.white,)
                          ),
                        ),
                        SizedBox(height: 200,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUpPage()));
                          }, child: Text("Register", style: TextStyle(fontSize: 18)),
                              style: ElevatedButton.styleFrom(primary: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 40, 20),
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        }, child: Text("Sign In", style: TextStyle(color: Colors.white)))
                      ]),
                    ))]),
        );
  }
}
