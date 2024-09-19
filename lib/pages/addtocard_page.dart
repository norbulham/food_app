import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/card_page.dart';
import 'package:food_app/pages/checkout_page.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class AddtocardPage extends StatelessWidget {
  const AddtocardPage({super.key});

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
                SizedBox(height: 40,),
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CardPage()));
                        },
                        child: Icon(Icons.arrow_back_ios_new)), // Back icon
                    SizedBox(width: 16),
                    Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Text("Card Page", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),))
                  ],
                ),
                ListView.builder(
                  itemCount: ms.myfavv.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.13,
                              width: MediaQuery.of(context).size.width * 0.30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image: AssetImage("${ms.myfavv[index].imgURL}"), fit: BoxFit.cover)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(right: 90),
                                        child: Text("${ms.myfavv[index].name}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        ms.deleteFav(ms.myfavv[index]);
                                      },
                                      icon: Icon(CupertinoIcons.multiply, size: 30, color: Colors.deepOrangeAccent,),
                                    ),
                                  ],
                                ),
                                Text("${ms.myfavv[index].text}", style: TextStyle(fontSize: 15),),
                                Row(
                                  children: [
                                    Text("\$ ${ms.myfavv[index].price}", style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        ms.decrmentQuantity(ms.myfavv[index]);
                                      },
                                      icon: Icon(Icons.remove_circle_outline_outlined, size: 25, color: Colors.deepOrangeAccent,),
                                    ),
                                    Text("${ms.myfavv[index].quantity}", style: TextStyle(fontSize: 22, ),),
                                    IconButton(
                                      onPressed: () {
                                        ms.incrmentQuantity(ms.myfavv[index]);
                                      },
                                      icon: Icon(Icons.add_circle, size: 25, color: Colors.deepOrangeAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Gap(20),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("promo Code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white70),),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange
                        ),
                        child: Center(child: Text('Apply', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                      ),
                    ],
                  ),
                ),Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SubTotal', style: TextStyle(fontSize: 18),),
                    Row(
                      children: [
                        Text('30.10',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(' USD'),
                      ],
                    ),
                  ],
                ),Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax and Fees',style: TextStyle(fontSize: 18)),
                    Row(
                      children: [
                        Text('5.5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Text(' USD'),
                      ],
                    ),
                  ],
                ),Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery',style: TextStyle(fontSize: 18)),
                    Row(
                      children: [
                        Text('3.00',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(' USD'),
                      ],
                    ),
                  ],
                ),Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Totalprice:",style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Text(" \$${ms.calculate()}", style: myStyle(20,Colors.black,FontWeight.bold),),
                        Text(' USD'),
                      ],
                    ),
                  ],
                ),Gap(20),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CheckoutPage()));
                  },
                  child: Container(
                    height: 47,
                    width: MediaQuery.of(context).size.width*0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.deepOrangeAccent
                    ),
                    child: Center(child: Text("CHECKOUT", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
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
