import 'package:flutter/material.dart';
import 'package:movie_review/view/home.dart';
import 'package:movie_review/view/profile_page.dart';
import 'package:movie_review/view/search_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int MycurrentIndex = 0;

  

  
  @override
  Widget build(BuildContext context) {
    final  pages = [
      const Home(),
      const SearchPage(),
      const Profile(), 
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: pages[MycurrentIndex],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.2)
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              onTap: (index){
                setState(() {
                  MycurrentIndex = index;
                });
              },
              currentIndex: MycurrentIndex,
              backgroundColor: const Color.fromARGB(255, 169, 167, 167),
              selectedItemColor: const Color.fromARGB(255, 201, 38, 26),
              unselectedItemColor: Colors.black,
              selectedFontSize: 15,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile'
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}