import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/data/deliver_list.dart';
import 'package:food_app/data/fav_list.dart';
import 'package:food_app/data/item_list.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/details_page.dart';
import 'package:food_app/pages/profile_page.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class DeliverHomepage extends StatefulWidget {
  const DeliverHomepage({super.key});

  @override
  State<DeliverHomepage> createState() => _HomePageState();
}

class _HomePageState extends State<DeliverHomepage> {

  final TextEditingController _searchController = TextEditingController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context, ms, _){
        return Scaffold(
          drawer: Drawer(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Padding(
                    padding: EdgeInsets.only(left: 100, top: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/photo_6228890902617768112_y.jpg'), fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                  Gap(20),
                  Text('   Borbu Lhamo', style: myStyle(20, Colors.black, FontWeight.bold),),
                  Text('    norbu2004@gmail.com'),
                  Gap(20),
                  ListTile(
                    leading: Icon(Icons.library_books_sharp, size: 30,),
                    title: Text("My Orders", style: TextStyle(fontSize: 17),),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (builder) => ProfilePage()));
                    },
                    child:ListTile(
                      leading: Icon(Icons.person_outline_rounded, size: 30,),
                      title: Text("My Profile", style: TextStyle(fontSize: 17),),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on_outlined, size: 30,),
                    title: Text("Delivery Address", style: TextStyle(fontSize: 17),),
                  ),
                  ListTile(
                    leading: Icon(Icons.payments_outlined, size: 30,),
                    title: Text("Payment Mthods", style: TextStyle(fontSize: 17),),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_phone_outlined, size: 30,),
                    title: Text("Contact Us", style: TextStyle(fontSize: 17),),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, size: 30,),
                    title: Text("Settings", style: TextStyle(fontSize: 17),),
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline, size: 30,),
                    title: Text("Helps & FAQs", style: TextStyle(fontSize: 17),),
                  ),
                  Gap(60),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffdee2e6)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.black,
                          ),
                        ),
                        Text('  Log Out', style: myStyle(16, Colors.black),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xffdee2e6),
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Deliver to', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 15,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('4102 Petty View Lane', style:TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color:Color(0xfff77f00) ),)
                  ],
                )
              ],
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (builder) => ProfilePage()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                    height:50 ,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xff3c6e71),width: 3)
                    ),
                    child: Image(image: AssetImage("assets/images/peofile.jpg"))
                ),
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            height: 790,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffdee2e6), Color(0xffdee2e6)])
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Choose your favorite",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 26, )),
                      Text("Fast Food",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 26,)),
                    ],
                  ),Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.75,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Find your favorite',
                              hintStyle: GoogleFonts.oleoScript(fontSize: 18, color: Colors.grey),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.search, color: Colors.grey,),
                                onPressed: () {
                                  // Handle search button press
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 45,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.sync_alt, color: Colors.deepOrangeAccent,size: 30,),
                          )
                        ],
                      )
                    ],
                  ), Gap(20),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: alldata.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          bool isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 70,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: isSelected
                                    ? Colors.orange.shade700 // Color when selected
                                    : Colors.white.withOpacity(0.6), // Color when not selected
                              ),
                              child: Column(
                                children: [
                                  Gap(20),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: CircleAvatar(
                                        child: Image(image: AssetImage("${alldata[index].imgURL}"),fit: BoxFit.cover,width: 100,)
                                    ),
                                  ),
                                  Text("${alldata[index].name}", style: myStyle(17,isSelected ? Colors.white : Colors.black, FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured Restaurants",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 23, )),
                      Row(
                        children: [
                          Text("See all",style: myStyle(17, Color(0xfffb5607),)),
                          Icon(Icons.arrow_drop_down, color: CupertinoColors.activeOrange,size: 35,)
                        ],
                      ),

                    ],
                  ),

                  Gap(20),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemCount: alldetails.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 230,
                          height: 480,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                            color: Color(0xffedede9),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (builder)=>DetailsPage(deliver: alldetails[index],)));
                                },

                                child: Container(
                                  height: 130,
                                  width: MediaQuery.of(context).size.width*0.6,
                                  decoration: BoxDecoration(
                                      borderRadius:BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                                      image: DecorationImage(image: AssetImage("${alldetails[index].imgURL}"),fit: BoxFit.cover)
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(bottom: 80),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("${alldetails[index].rating}",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18, )),Gap(5),
                                              Icon(Icons.star, size: 20,color: Color(0xffffc300),)
                                            ],
                                          ),
                                        ),Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white.withOpacity(0.6)
                                            ),
                                            child: Icon(Icons.favorite, color: Colors.white,)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  child: Text("${alldetails[index].name}",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20, ),textAlign: TextAlign.start)
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.free_breakfast_outlined, size: 20,),Gap(5),
                                      Text("${alldetails[index].author}",style:TextStyle( fontSize: 15,color: Colors.black.withOpacity(0.7) )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.timer_sharp,size: 20,),Gap(5),
                                      Text("${alldetails[index].time}",style:TextStyle( fontSize: 15,color: Colors.black.withOpacity(0.7) )),
                                    ],
                                  ),
                                ],
                              ),Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("FRIED RICE",style:TextStyle( fontSize: 15,color: Colors.black.withOpacity(0.7) )),
                                  Text("PIZZA",style:TextStyle( fontSize: 15,color: Colors.black.withOpacity(0.7) )),
                                  Text("DRINKS",style:TextStyle( fontSize: 15,color: Colors.black.withOpacity(0.7) )),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),Gap(20),
                  Row(
                    children: [
                      Text("Popular Fast Food",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 23, ))
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: allitems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.78
                    ),
                    itemBuilder: (context,index){
                      return Card(
                        // elevation: 4,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                                image: DecorationImage(
                                    image: AssetImage("${allitems[index].imgURL}"),fit: BoxFit.cover),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 70),
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("\$${allitems[index].price}", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18, )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 70),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white.withOpacity(0.5)
                                    ),
                                    child: Icon(Icons.favorite, color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${allitems[index].name}", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ), textAlign: TextAlign.start,),
                                Text("${allitems[index].author}", style:TextStyle( fontSize: 15, ), textAlign: TextAlign.start,),
                                Text("${allitems[index].rating}", style:TextStyle(fontSize: 15, ), textAlign: TextAlign.start,),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
