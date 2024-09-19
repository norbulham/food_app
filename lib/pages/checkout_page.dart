import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/addtocard_page.dart';
import 'package:food_app/pages/last_page.dart';
import 'package:food_app/pages/review_page.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>AddtocardPage()));
                        },
                        child: Icon(Icons.arrow_back_ios_new))
                  ],
                ),
                Column(
                  children: [
                    ListView.builder(
                      itemCount: ms.myfavv.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage("${ms.myfavv[index].imgURL}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Positioned chicken logo
                                    Positioned(
                                      top: MediaQuery.of(context).size.height * 0.13,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 45,
                                              backgroundImage: AssetImage('assets/images/chickenlogo-removebg-preview.png'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 60),
                                // Text information
                                Text("Chicken Hut", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),Gap(10),
                                Text("4102 Pretty View Lanenda", style: TextStyle(fontSize: 16, color: Colors.grey,),),Gap(10),
                                SizedBox(height: 5),
                                Text("● Order Delivered", style: TextStyle(color: Colors.green,fontSize: 16),),Gap(20),
                                Text("Please Rate Delivery Service", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),Gap(20),
                                Text("Good", style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 25),),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
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
                                  hintText: "write review",
                                  //border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Write review";
                                  }
                                  return null;
                                },
                              ),Gap(100),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minWidth: MediaQuery.of(context).size.width * 0.7,
                                height: 50,
                                color: Colors.deepOrangeAccent,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ReviewPage()));
                                  },
                                child: Text("Summit", style: myStyle(23, Colors.white,FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
