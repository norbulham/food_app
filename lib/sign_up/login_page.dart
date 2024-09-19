import 'package:flutter/material.dart';
import 'package:food_app/bottom_nav.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/data/profile_list.dart';
import 'package:food_app/sign_up/otp_page.dart';
import 'package:food_app/sign_up/registration_page.dart';
import 'package:get/get.dart';

import 'forgot_password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: -70,
                      right: -60,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 330,
                      top: -45,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(width: 30, color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 250,
                      top: -90,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      top: 40,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.001,
                                    offset: Offset(0.3, 0.3),
                                    blurStyle: BlurStyle.outer
                                )
                              ]
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (builder) => RegistrationPage()));
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text("Login", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 35),)
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("E-mail")
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          suffixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          if (value != userData[0].email) {
                            return "Email does not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("Password")
                        ],
                      ),SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: _passwordController,
                        obscureText: _isObs,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObs = !_isObs;
                              });
                            },
                            icon: Icon(
                              _isObs ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                          if (value != userData[0].password) {
                            return "Password does not match";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OtpPage()),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: myStyle(20, Color(0xffca6702)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minWidth: MediaQuery.of(context).size.width * 0.66,
                  height: 48,
                  color: Color(0xffca6702),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (_phoneEmailController.text == userData[0].email) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => PracticeBottomNavBar(),
                          ),
                              (route) => false,
                        );
                      }
                    }
                  },
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder) => PracticeBottomNavBar()));
                      },
                      child: Text("Log In", style: myStyle(19, Colors.white, FontWeight.bold),)
                  ),
                ),
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(color: Colors.black, fontSize: 17,),),
                  Text('Sign up ', style: TextStyle(color: Color(0xffca6702), fontSize: 17,),)
                ],
              ),SizedBox(height: 20,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('sign in with', style: TextStyle(color: Colors.black, fontSize: 16),),
                ],
              ),SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Sign in with Facebook
                      },
                      icon: Icon(Icons.facebook, color: Colors.blueAccent,size: 35,),
                      label: Text('FACEBOOK', style: TextStyle(color: Colors.black, fontSize: 15),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 160,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Sign in with Google
                      },
                      icon: Icon(Icons.g_translate,color: Colors.blueAccent,size: 35,),
                      label: Text('GOOGLE',style: TextStyle(color: Colors.black, fontSize: 15)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}