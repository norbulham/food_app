import 'package:flutter/material.dart';
import 'package:food_app/auth/auth_class.dart';
import 'package:food_app/bottom_nav.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/sign_up/forgot_password.dart';
import 'package:food_app/sign_up/login_page.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final AuthClass _auth = AuthClass();
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder) => Login()));
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
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(50),
                  Text(
                    'Verification Code',
                    style: myStyle(35, null, FontWeight.bold),
                  ),
                  Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Please type the verification code', style: myStyle(18, Colors.grey),),
                      Text('sent to your number.', style: myStyle(18, Colors.grey),),
                    ],
                  ),
                  Gap(30),
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) => _buildOTPInputField(index)),
                    ),
                  ),
                  Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('I don\'t receive a code! '),
                      GestureDetector(
                        onTap: () {
                          // Handle resend OTP logic here
                        },
                        child: Text(
                          'Please resend',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),Gap(50),
            Center(
              child: MaterialButton(
                color: primaryColor,
                minWidth: 250,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: primaryColor),
                ),
                onPressed: () async {
                  String otp = _controllers.map((controller) => controller.text).join();
                  if (otp.length == 6) {
                    try {
                      await _auth.verifyOtp(otp, 'verificationId');
                      Get.to(() => PracticeBottomNavBar());
                    } catch (e) {
                      Get.snackbar('Error', 'Failed to verify OTP');
                    }
                  } else {
                    Get.snackbar('Invalid OTP', 'OTP must be 6 digits long');
                  }
                },
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ForgetPassword()));
                    },
                    child: Text('SEND', style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPInputField(int index) {
    return Container(
      width: 45,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 24),
          ),
          style: TextStyle(fontSize: 24, color: Colors.black),
          keyboardType: TextInputType.number,
          maxLength: 1,
          onChanged: (value) {
            if (value.length == 1 && index < 5) {
              _focusNodes[index + 1].requestFocus();
            } else if (value.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '!';
            }
            return null;
          },
        ),
      ),
    );
  }
}