import 'package:flutter/material.dart';
import 'package:food_app/auth/auth_class.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/sign_up/otp_page.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  AuthClass _auth = AuthClass();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
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
                              blurStyle: BlurStyle.outer)
                        ]),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed('/login');
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone Number',
                  style: myStyle(30, Colors.black, FontWeight.bold),
                ),
                Gap(10),
                Text(
                  'Enter your phone number to verify ',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'your account',
                  style: TextStyle(color: Colors.grey),
                ),
                Gap(15),
                SizedBox(
                  child: IntlPhoneField(
                    controller: _phoneController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                Gap(40),
                Center(
                  child: MaterialButton(
                    color: primaryColor,
                    minWidth: 250,
                    height: 50,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: primaryColor)),
                    onPressed: () async {
                      _auth.sendOtp(_phoneController.text);
                      Get.to(OtpPage());

                    },
                    child: Text(
                      'SEND',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
