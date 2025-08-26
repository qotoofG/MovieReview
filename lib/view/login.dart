import 'package:flutter/material.dart';
import 'package:movie_review/model/box.dart';
import 'package:movie_review/view/SingUP.dart';
import 'package:movie_review/model/user.dart';
import 'package:movie_review/widget/bottom_bar.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginState extends State<Login> {

  late  bool securetext ;
  final _formkey = GlobalKey<FormState>();
  String email =_emailController.text;

  @override
  void initState() {
    securetext = true;
    super.initState();
  }
  // Future<void> saveEmailToSharedPreferences(String email) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('userEmail', email);  // Save the email
  // }
  void _login(){
    if (BoxUser.containsKey(email)) {
      User? confirm = BoxUser.get(email);
      if(confirm != null &&  confirm.password == _passwordController.text){
        // saveEmailToSharedPreferences(_emailController.text);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomBar()));
        _emailController.clear();
        _passwordController.clear();
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect password!')),
        );
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please SingUp First')),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
         backgroundColor: Colors.black26,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.07,
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 201, 38, 26),
                    ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.04,
                    right: MediaQuery.of(context).size.width*0.04
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email,color:Color.fromARGB(255, 195, 193, 193),),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 17,color:Color.fromARGB(255, 195, 193, 193),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                      ),
                    ),
                    style: const TextStyle(color: Color.fromARGB(255, 188, 186, 186),),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.04,
                    right: MediaQuery.of(context).size.width*0.04
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: securetext,
                    decoration:  InputDecoration(
                      prefixIcon: const Icon(Icons.lock,color:Color.fromARGB(255, 195, 193, 193),),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            securetext = !securetext;
                          });
                        }, 
                        icon: securetext == true?const Icon(Icons.visibility_off,color: Color.fromARGB(255, 195, 193, 193),):const Icon(Icons.visibility,color: Color.fromARGB(255, 195, 193, 193),)
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(fontSize: 17,color:Color.fromARGB(255, 195, 193, 193),),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                      ),
                    ),
                    style: const TextStyle(color:Color.fromARGB(255, 188, 186, 186),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: TextButton(
                    onPressed: (){}, 
                    child: const Text(
                      'Forget your Password?',
                      style: TextStyle(color:Color.fromARGB(255, 195, 193, 193),fontSize: 15),
                    )
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        _login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 201, 38, 26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding: const EdgeInsets.only(left: 40,right: 40,top: 13,bottom: 13),
                        elevation: 5,
                      ), 
                      child: const Text(
                        'Login',
                        style: TextStyle(color:Colors.white,fontSize: 17),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signup()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 201, 38, 26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding: const EdgeInsets.only(left: 35,right: 35,top: 13,bottom: 13),
                        elevation: 5,
                      ), 
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color:Colors.white,fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}