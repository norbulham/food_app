import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/checkout_page.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class LastPage extends StatefulWidget {
  const LastPage({super.key});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  List<bool> _isStarSelected = [false, false, false, false, false];
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          height: 790,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffdee2e6), Color(0xffdee2e6)]
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CheckoutPage()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 290),
                      child: Icon(Icons.arrow_back_ios_new, size: 25,)
                  ),
                ),Gap(60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/chickenlogo-removebg-preview.png"), fit: BoxFit.cover)
                      ),
                    )
                  ],
                ),Gap(20),
                Column(
                  children: [
                    Text("How was your most ",style: TextStyle(fontSize: 25, color: Colors.black)),
                    Text(" recent Chicken Hut purchase?",style: TextStyle(fontSize: 25, color: Colors.black)),
                  ],
                ),Gap(45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Excellent",style: TextStyle(fontSize: 19, color: Colors.deepOrangeAccent)),

                  ],
                ),Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:List.generate(5, (index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          _isStarSelected[index] = !_isStarSelected[index];
                        });
                      },
                      child: Icon(_isStarSelected[index] ? Icons.star : Icons.star_border,size: 50,
                        color: _isStarSelected[index] ? Color(0xfffb8b24) : Colors.grey,
                      ),
                    );
                  })

                ),
                Padding(
                    padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: "write",
                                  //border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Write";
                                  }
                                  return null;
                                },
                              ),Gap(160),
                              MaterialButton(
                                height: 45,
                                color:Colors.deepOrangeAccent,
                                minWidth: double.infinity,
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PaymentInfo()));
                                  Get.snackbar('Payment Status','Payment Successful',titleText:Text('Payment Status', style: myStyle(20,Colors.black, FontWeight.bold),),messageText: Text("Payment Sucessful", style: myStyle(18, Colors.black),), backgroundColor: Color(0xffcaf0f8));
                                },
                                child: Container(
                                    child: Text("Summit", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
