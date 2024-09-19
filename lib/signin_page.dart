import 'package:flutter/material.dart';
import 'package:food_app/sign_up/phone_page.dart';
import 'package:food_app/sign_up/registration_page.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(FoodHubApp());
}

class FoodHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/plate1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Skip functionality
                    },
                    child: Container(
                        height: 26,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                        ),
                        child: Center(child: Text('Skip', style: TextStyle(color: Colors.red, fontSize: 16),))),
                  ),
                ),
                Spacer(),
                Text('Welcome to', style: TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold,)),
                Text('FoodHub', style: TextStyle(color: Colors.orange, fontSize: 40, fontWeight: FontWeight.bold,),),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your favourite foods, delivered', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    Text(' fast at your door.', style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 150,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 110,
                      color: Colors.white,
                    ),Gap(15),
                    Text('sign in with', style: TextStyle(color: Colors.white, fontSize: 16),),
                    Gap(15),
                    Container(
                      height: 2,
                      width: 110,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(height: 40),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>phone()));
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white)
                      ),
                      child: Center(child: Text('Start with email or phone', style: TextStyle(fontSize: 18, color: Colors.white),)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Sign In page
                    },
                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>RegistrationPage()));
                        },
                        child: Text('Already have an account? Sign In', style: TextStyle(color: Colors.white, fontSize: 17,),))
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}