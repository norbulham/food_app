import 'package:flutter/material.dart';
import 'package:food_app/manage_state.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
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
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new_outlined,size: 25,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("My Orders",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        height:50 ,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xff3c6e71),width: 3)
                        ),
                        child: Image(image: AssetImage("assets/images/peofile.jpg"))
                    ),
                  ],
                ),Gap(40),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.45,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("Upcoming",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                    ),Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.45,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("History",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                    ),
                  ],
                ),Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("#17274074", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 18),),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 60,
                        width: 59,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(image: AssetImage("assets/images/rimberiologo.jpg"),fit: BoxFit.cover,)
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3 items", style: TextStyle(fontSize: 16, color: Colors.grey),),
                          Row(
                            children: [
                              Text("Rimberio   ",style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold)),
                              Icon(Icons.add_circle, color: Colors.green,size: 17,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estimate Arrival',style: TextStyle(fontSize: 17, color: Colors.grey)),
                    Text('Now',style: TextStyle(fontSize: 17, color: Colors.grey)),
                  ],
                ),Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('30',style: TextStyle(fontSize: 40, color: Colors.black)),
                        Text('  min',style: TextStyle(fontSize: 17, color: Colors.black)),
                      ],
                    ),
                    Text('Your order is on the way',style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.40,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                    ),Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.40,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("Track-Order",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                    ),
                  ],
                ),Gap(20),
                Row(
                  children: [
                    Text("Lasted Orders",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
                  ],
                ),Gap(20),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 59,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(image: AssetImage("assets/images/shutterstocklogo.webp"),fit: BoxFit.cover,)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("02 Sep, 12:00.  3 items", style: TextStyle(fontSize: 16, color: Colors.grey),),
                              Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: Text("\$20.00", style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Shutter Stock  ",style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold)),
                              Icon(Icons.add_circle, color: Colors.green,size: 17,)
                            ],
                          ),
                          Text("Order Delivered",style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.40,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("Rate",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                    ),Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.40,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("Re-Order",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                    ),
                  ],
                ),Gap(30),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 59,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(image: AssetImage("assets/images/ferry.jpg"),fit: BoxFit.cover,)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("01 Jan, 12:00.  2 items", style: TextStyle(fontSize: 16, color: Colors.grey),),
                              Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: Text("\$16.10", style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Ferry  ",style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold)),
                              Icon(Icons.add_circle, color: Colors.green,size: 17,)
                            ],
                          ),
                          Text("Order Delivered",style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.40,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                    ),Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.40,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text("Order Again",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
