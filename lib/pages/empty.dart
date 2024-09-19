// import 'package:flutter/material.dart';
// import 'package:food_app/authencation/auth_service.dart';
// import 'package:food_app/constant.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class signup extends StatefulWidget {
//   const signup({super.key});
//
//   @override
//   State<signup> createState() => _signupState();
// }
//
// class _signupState extends State<signup> {
//   AuthServices _auth= AuthServices();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/image/c.png'),
//                   fit: BoxFit.fitWidth),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     Colors.white.withOpacity(0.5),
//                     Colors.black87.withOpacity(0.1),
//                     Color(0xff191B2F),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 )),
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 150, left: 20, right: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Welcome to',
//                     style: GoogleFonts.prompt(
//                         fontSize: 40, fontWeight: FontWeight.bold,shadows:<BoxShadow>[
//                       BoxShadow(color: Colors.white,offset: Offset(2, 2))
//                     ])),
//                 Text('FoodHub',
//                     style: GoogleFonts.prompt(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: primaryColor,shadows:<BoxShadow>[
//                       BoxShadow(color: Colors.black,offset: Offset(2, 2))
//                     ])),
//                 Gap(30),
//                 Text(
//                   'Your favourite foods delivered',
//                   style: myStyle(15, null, FontWeight.bold),
//                 ),
//                 Text(
//                   'fast at your door',
//                   style: myStyle(15, null, FontWeight.bold),
//                 ),
//                 Gap(200),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         color: Colors.white,
//                         thickness: 0.5,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Text(
//                         'sign in with  ',
//                         style: myStyle(
//                           15,
//                           Colors.white,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         color: Colors.white,
//                         thickness: 0.5,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Gap(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           InkWell(onTap: ()async{
//
//                           },
//                             child: Container(
//                               margin: EdgeInsets.only(top: 6),
//                               height: 35,
//                               width: 35,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   image: DecorationImage(
//                                       image:
//                                       AssetImage('assets/image/facebook.png'),
//                                       fit: BoxFit.cover)),
//                             ),
//                           ),
//                           Text(
//                             'FACEBOOK  ',
//                             style: myStyle(
//                               15,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 50,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           InkWell(onTap: ()async{
//                             _auth.signInWithGoogle();
//                           },
//                             child: Container(
//                               margin: EdgeInsets.only(top: 6),
//                               height: 30,                              width: 30,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   image: DecorationImage(
//                                       image:
//                                       AssetImage('assets/image/google.png'),
//                                       fit: BoxFit.contain)),
//                             ),
//                           ),
//                           Text(
//                             'GOOGLE  ',
//                             style: myStyle(
//                               15,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Gap(30),
//                 InkWell(onTap: (){
//                   Get.offAllNamed('/register');
//                 },
//                   child: Container(
//                     height: 60,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white12,
//                         border: Border.all(color: Colors.white)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Start with email or Phone',
//                           style: myStyle(20, Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Gap(10),
//                 InkWell(
//                   onTap: (){
//                     Get.offAllNamed('/login');
//                   },
//                   child: Center(
//                       child: Text(
//                         'Already have an account? sign in',
//                         style: myStyle(15, Colors.white),
//                       )),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
