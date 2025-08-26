import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_review/model/box.dart';
import 'package:movie_review/model/review.dart';
import 'package:movie_review/view/splashScreen.dart';
import 'package:movie_review/model/user.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ReviewAdapter());
  Hive.registerAdapter(UserAdapter());
  BoxUser = await Hive.openBox<User>('mybox');
  BoxReview = await Hive.openBox<Review>('mybox1');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const Splashscreen(),
    );
  }
}