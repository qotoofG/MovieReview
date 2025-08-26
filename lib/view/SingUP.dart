// ignore: file_names
import 'package:flutter/material.dart';
import 'package:movie_review/model/box.dart';
import 'package:movie_review/model/user.dart';
import 'package:movie_review/view/login.dart';
import 'package:movie_review/widget/bottom_bar.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _usernameController = TextEditingController();

class _SignupState extends State<Signup> {
  late bool securetext;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    securetext = true;
    super.initState();
  }

  // Future<void> saveEmailToSharedPreferences(String email) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('userEmail', email); // Save the email
  // }

  void _singup() {
    if (BoxUser.containsKey(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email already exists!')),
      );
      return;
    }
    BoxUser.put(
      _emailController.text.toLowerCase(),
      User(
        name: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text
      )
    );
    // saveEmailToSharedPreferences(_emailController.text);
    Navigator.push(context,MaterialPageRoute(builder: (context) =>  BottomBar()));
    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 188, 186, 186),
                        size: 30,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color.fromARGB(255, 201, 38, 26),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: TextFormField(
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 188, 186, 186),
                      ),
                      labelText: 'Name',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 195, 193, 193),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 195, 193, 193),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 195, 193, 193),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 188, 186, 186),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 188, 186, 186),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 195, 193, 193),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 195, 193, 193),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 195, 193, 193),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 188, 186, 186),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: securetext,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 188, 186, 186),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              securetext = !securetext;
                            });
                          },
                          icon: securetext == true
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Color.fromARGB(255, 188, 186, 186),
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Color.fromARGB(255, 188, 186, 186),
                                )),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 195, 193, 193),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 195, 193, 193),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 195, 193, 193),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 188, 186, 186),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      _singup();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 201, 38, 26),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 13, bottom: 13),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Create',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text(
                      'Already have an account? Sign in',
                      style: TextStyle(
                          color: Color.fromARGB(255, 195, 193, 193),
                          fontSize: 15),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
