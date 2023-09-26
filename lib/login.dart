import 'package:flutter/material.dart';
import 'package:login_with_shared_preferences/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///___ AppBar
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0.0,
        backgroundColor: Colors.white,
        titleTextStyle:const TextStyle(
            fontSize: 36, fontWeight: FontWeight.w500, color: Colors.black87),
        // title: Text("Welcome!"),
      ),

      ///___ Body
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 85,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 45,
                    child: Icon(
                      Icons.person,
                      size: 41,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 75,
                  ),

                  ///___ Name Text
                  TextFormField(
                    controller: nameController,
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                    decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      prefixIcon:const Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.black87,
                      ),
                      hintStyle:const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        //borderSide: BorderSide(color: Colors.black87,width: 5)
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Name";
                      }
                    },
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  ///___ Password Text
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style:const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      prefixIcon:const Icon(
                        Icons.lock_open,
                        size: 35,
                        color: Colors.black87,
                      ),
                      hintStyle:const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        //borderSide: BorderSide(color: Colors.black87,width: 5)
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 35,
                  ),

                  ///___ Login Button
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 4,
                              )
                            :const Text(
                                "LogIn",
                                style: TextStyle(fontSize: 21),
                              ),
                        onPressed: () async {
                          if (isLoading) return;
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(const Duration(seconds: 1));
                          setState(() {
                            isLoading = false;
                          });
                          if (_formKey.currentState!.validate()) {
                            var sharedPref =
                                await SharedPreferences.getInstance();
                            sharedPref.setBool(SplashState.LOGINKEY, true);
                            sharedPref.setString(
                                "name", nameController.text.toString());
                            sharedPref.setString(
                                "password", passwordController.text.toString());
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                          ;
                        },
                      ),
                    ),
                  ),
                  //const SizedBox(height:85,),
                ],
              ),
            )),
      ),
    );
  }
}
