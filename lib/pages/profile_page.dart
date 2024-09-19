import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/pages/deliver_homepage.dart';
import 'package:gap/gap.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _profileState();
}

class _profileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ///design image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///profile pic
                Expanded(
                  child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 160,),
                          height: 170,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/Vector-removebg-preview.png'),
                                  fit: BoxFit.fitWidth)),
                        ),
                    Positioned(
                      left: 90,
                      bottom: 54,
                      child: Container(
                        // margin: EdgeInsets.only(bottom: 90),
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                AssetImage('assets/images/Vector__1_-removebg-preview.png'),
                                fit: BoxFit.fitWidth)),
                      ),
                    ),
                        Positioned(
                          left: -10,
                          bottom: -28,
                          child: Container(
                            margin: EdgeInsets.only(left: 5, bottom: 50),
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                    AssetImage('assets/images/Vector__2_-removebg-preview.png'),
                                    fit: BoxFit.fitWidth)),
                          ),
                        ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>DeliverHomepage()));
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_ios, size: 20,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 125,
                      left: 125,
                      child: Stack(
                          clipBehavior: Clip.none,
                          children:[ Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/photo_6228890902617768112_y.jpg'),
                                    fit: BoxFit.fill),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(color: Colors.white, spreadRadius: 10)
                                ]),
                          ),
                            Positioned(
                                top: 80,left: 80,
                                child: Container(
                                  child: Container(height: 35,width: 35,decoration:
                                  BoxDecoration(border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),shape: BoxShape.circle,color: Colors.white),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.camera_alt,color: Colors.grey,size: 22,)
                                      ],),),
                                )
                            )
                          ]),
                    ),
                  
                  ]),
                )
              ],
            ),Gap(90),
            Column(
              children: [
                Text('Eljad Eendaz',style: myStyle(20,Colors.black,FontWeight.bold),),
                // InkWell(onTap: (){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (builder)
                //   =>edit()));
                // },
                //     child: Text('Edit Profile',style: myStyle(13,Colors.grey,FontWeight.bold),)),


                ///details
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Gap(30),
                      Row(children: [
                        Text('Full name',style: myStyle(16,Colors.grey,FontWeight.bold),),
                      ],),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,width: 370,decoration:
                          BoxDecoration(borderRadius:
                          BorderRadius.circular(10),border: Border.all(
                            color: Colors.grey.shade300,
                          )),
                            child: Row(children: [
                              Text('')
                            ],),
                          ),
                        ],
                      ), Gap(30),
                      Row(children: [
                        Text('E-mail',style: myStyle(16,Colors.grey,FontWeight.bold),),
                      ],),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,width: 370,decoration:
                          BoxDecoration(borderRadius:
                          BorderRadius.circular(10),border: Border.all(
                            color: Colors.grey.shade300,
                          )),
                          ),
                        ],
                      ), Gap(30),
                      Row(children: [
                        Text('Phone Number',style: myStyle(16,Colors.grey,FontWeight.bold),),
                      ],),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,width: 370,decoration:
                          BoxDecoration(borderRadius:
                          BorderRadius.circular(10),border: Border.all(
                            color: Colors.grey.shade300,
                          )),
                          ),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
