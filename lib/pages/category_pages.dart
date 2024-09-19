import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/data/category_list.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/favorites_pages.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class CategoryPages extends StatefulWidget {
  const CategoryPages({super.key});

  @override
  State<CategoryPages> createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  bool _isFavorite = false;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>FavoritesPages()));
                        },
                        child: Icon(Icons.arrow_back_ios_new)), // Back icon
                    SizedBox(width: 16),
                    Image.asset('assets/images/shake1-removebg-preview.png',width: 180, height: 180, fit: BoxFit.cover,),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 140),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Choose your', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),textAlign: TextAlign.start,),
                      Text('Favorite Shake', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),textAlign: TextAlign.start,),
                      Text('80 types of shake', style: TextStyle(color: Colors.black54,fontSize: 18),),
                    ],
                  ),
                ),

                Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 100),
                      child: Row(
                        children: [
                          Text('Sort by:', style: TextStyle(color: Colors.black,fontSize: 16),),
                          Text('   Popular', style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 16),),
                          Icon(Icons.arrow_drop_down, color: Colors.black54,),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Icon(CupertinoIcons.arrow_right_arrow_left, size: 20,color: Colors.deepOrangeAccent,)
                    )
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: fastFoodata.length,
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
                                image: AssetImage("${fastFoodata[index].imgURL}"),fit: BoxFit.cover),
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
                                        Text("${fastFoodata[index].price}", style: myStyle(18, Colors.black, FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ms.addToFav(fastFoodata[index]);
                                    },
                                    icon: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white.withOpacity(0.5)
                                        ),
                                        child: Icon(Icons.favorite,
                                          color: fastFoodata[index].isFav ? Colors.red : Colors.white,size: 35,
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
                                          Text("${fastFoodata[index].rating} ", style: myStyle(18, Colors.black, FontWeight.bold)),
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
                              Text("${fastFoodata[index].name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,), textAlign: TextAlign.start,),
                              Text("${fastFoodata[index].text}",style: TextStyle(fontSize: 16,color: Colors.black54)),
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
