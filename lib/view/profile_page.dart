import 'package:flutter/material.dart';
import 'package:movie_review/view/login.dart';
import 'package:movie_review/model/box.dart';
import 'package:movie_review/model/review.dart';
// import 'package:movie_review/model/user.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // String? email;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadEmail();
  // }

  // Future<void> _loadEmail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     email = prefs.getString('email'); // Retrieve email
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // print("Email received in Profile: ${email}");
    // User? person = BoxUser.get(email?.toLowerCase());
    // if (person == null) {
    // return const Scaffold(
    //   body: Center(
    //     child: Text(
    //       'User not found!',
    //       style: TextStyle(color: Colors.black, fontSize: 20),
    //     ),
    //   ),
    // );
    // }
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/movieflix.png',
          fit: BoxFit.cover,
          height: 110,
          filterQuality: FilterQuality.high,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 188, 186, 186),
                size: 25,
              ))
        ],
      ),
      body: BoxReview.isEmpty
        ?const Center(
          child: Text(
            'No reviews available.',
            style: TextStyle(
              color: Color.fromARGB(255, 188, 186, 186), fontSize: 18
            ),
          ),
        )
        :ListView.builder(
          itemCount: BoxReview.length,
          itemBuilder: (context, index) {
          Review r1 = BoxReview.getAt(index);
            return Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        r1.movieimg!,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            r1.movietitle!,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 188, 186, 186),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              showDialog(
                                context: context, 
                                builder: (context)=>AlertDialog(
                                  backgroundColor: const Color.fromARGB(255, 188, 186, 186),
                                  title: Text(
                                    r1.movietitle!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  content: Text(
                                    r1.myreview!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, 
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 201, 38, 26),
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    )
                                  ],
                                )
                              );
                            }, 
                            child: const Text(
                              'Read My Review',
                              style: TextStyle(
                                color: Color.fromARGB(255, 188, 186, 186),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Row(
                            children: List.generate(
                              int.parse(r1.rating!), 
                              (index) => const Icon(
                                Icons.star,
                                color: Color.fromRGBO(255, 193, 7, 1), 
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height:MediaQuery.of(context).size.height * 0.015,
                          ),
                          Icon(
                              r1.favorite == true ?Icons.favorite:Icons.favorite_border_outlined,
                              color: r1.favorite == true ?const Color.fromARGB(255, 201, 38, 26):const Color.fromARGB(255, 188, 186, 186),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
