import 'package:flutter/material.dart';
import 'package:food_app/data/deliver_list.dart';
import 'package:food_app/pages/deliver_homepage.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/model/deliver_model.dart';
import 'package:food_app/pages/card_page.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.deliver});
  DeliverModel deliver;

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _) {
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
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                          height: 230,
                          width: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(deliver.imgURL), fit: BoxFit.cover,)
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder)=>DeliverHomepage()));
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white
                                ),
                                child: Center(child: Icon(Icons.arrow_back_ios, size: 25,)),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.deepOrangeAccent
                              ),
                              child: Center(child: Icon(Icons.favorite, size: 27,color: Colors.white,)),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      Container(
                          margin: EdgeInsets.only(right: 250),
                          child: Text(deliver.name1, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Color(0xfff77f00), size: 30,),
                          Text("${deliver.rating}", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                          Text(" (30+)", style: TextStyle(fontSize: 18,),),
                          Text(" See Review", style: TextStyle(fontSize: 18, color: Color(0xfff77f00), decoration: TextDecoration.underline, decorationColor: Color(0xfff77f00)),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("\$", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xfff77f00)),),
                              Text("${deliver.price}", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xfff77f00)),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  ms.decreaseQuantity(deliver);
                                },
                                icon: Icon(Icons.remove_circle_outline_outlined, size: 30, color: Colors.red.withOpacity(0.6),),
                              ),
                              Gap(10),
                              Text("${deliver.quantity}", style: TextStyle(fontSize: 22,),),
                              Gap(10),
                              IconButton(
                                onPressed: () {
                                  ms.increaseQuantity(deliver);
                                },
                                icon: Icon(Icons.add_circle, size: 30, color: Colors.redAccent.withOpacity(0.7),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(deliver.brief, style: TextStyle(fontSize: 17),),
                    ],
                  ),
                ),Gap(15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Choice of Add On", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,))
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle
                              ),
                              child: Image(image: AssetImage("assets/images/aa-removebg-preview.png"))
                          ),
                          Text("  Fast Food", style: TextStyle(fontSize: 17,)),

                        ],
                      ),
                      Row(
                        children: [
                          Text("+\$", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text("${deliver.price}   ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                          Icon(Icons.circle_notifications_outlined,)
                        ],
                      )
                    ]
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle
                              ),
                              child: Image(image: AssetImage("assets/images/bb-removebg-preview.png"))
                          ),
                          Text("  Healthy Fruits", style: TextStyle(fontSize: 17,)),

                        ],
                      ),
                      Row(
                        children: [
                          Text("+\$", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text("${deliver.price}   ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                          Icon(Icons.circle_notifications_outlined,)
                        ],
                      )
                    ]
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle
                              ),
                              child: Image(image: AssetImage("assets/images/vegetable-removebg-preview.png"))
                          ),
                          Text("  Vegetables", style: TextStyle(fontSize: 17,)),

                        ],
                      ),
                      Row(
                        children: [
                          Text("+\$", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text("${deliver.price}   ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                          Icon(Icons.circle_notifications_outlined,)
                        ],
                      )
                    ]
                ),Gap(20),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CardPage()));
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xfff77f00),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Icon(Icons.shopping_bag, color: Color(0xfff77f00),)
                        ),
                        Center(child: Text("    ADD TO CART", style: TextStyle(color: Colors.white,fontSize: 16),))
                      ],
                    ),
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