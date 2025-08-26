// ignore: file_names
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_review/view/login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:   Scaffold(
        backgroundColor: Colors.black26,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/movieflix.png',height: 270,width: 270,),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            Center(
              child: Lottie.asset('assets/animations/movieloader.json'),
            )
          ],
        )
      )
    );
  }
}