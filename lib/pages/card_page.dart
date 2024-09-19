import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/data/card_list.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/addtocard_page.dart';
import 'package:provider/provider.dart';
class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>AddtocardPage()));
                        },
                        child: Icon(Icons.arrow_back_ios_new)), // Back icon
                    SizedBox(width: 16),
                    Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Text("Add To Card", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),))
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cardData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5
                  ),
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 160,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("${cardData[index].imgURL}"),fit: BoxFit.cover),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("\$ ",style: myStyle(18, Colors.deepOrangeAccent, FontWeight.bold)),
                                        Text("${cardData[index].price}", style: myStyle(18, Colors.black, FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ms.addToMyFav(cardData[index]);
                                    },
                                    icon: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white
                                      ),
                                      child: Icon(Icons.card_giftcard,
                                        color: cardData[index].myFav ? Colors.pink : Colors.grey,size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 60),
                                      height: 50,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white
                                      ),
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("${cardData[index].rating} ", style: myStyle(18, Colors.black, FontWeight.bold)),
                                          Icon(Icons.star, color: Colors.orange,size: 20,)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.only(right: 160),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(width: 6,),
                              Text("${cardData[index].name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,), textAlign: TextAlign.start,),
                              Text("${cardData[index].text}",style: TextStyle(fontSize: 16,color: Colors.black54)),
                            ],
                          ),
                        )
            
                      ],
                    );
                  },
                ),
            
              ],
            ),
          ),
        ),
      );
    });
  }
}
