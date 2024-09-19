import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/data/category_list.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/pages/category_pages.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class FavoritesPages extends StatefulWidget {
  const FavoritesPages({super.key});

  @override
  State<FavoritesPages> createState() => _FavoritesPagesState();
}

class _FavoritesPagesState extends State<FavoritesPages> {
  bool _isClicked = false;
  bool _ischanged = false;

  void _toggleColor() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }
  void _mycolor() {
    setState(() {
      _ischanged = !_ischanged;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>( builder: (context, ms, _) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CategoryPages()));
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined,size: 25,)),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("My Favorties ",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
                ),Gap(10),
                Row(
                  children: [
                    InkWell(
                      onTap: _toggleColor ,
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                            color: _isClicked ? Colors.white : Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("Shake Items",style: TextStyle(color: _isClicked ? Colors.black54 : Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
                      ),
                    ),InkWell(
                      onTap: _mycolor ,
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                            color: _ischanged ? Colors.white : Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("Resturants",style: TextStyle(color: _ischanged ? Colors.black54 : Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ms.fav.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5
                  ),
                  itemBuilder: (context,index){
                    return InkWell(
                      // onTap: (){
                      //   Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>DetailsPages()));
                      // },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 160,
                            width: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage("${ms.fav[index].imgURL}"),fit: BoxFit.cover),
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
                                          Text("${ms.fav[index].price}", style: myStyle(18, Colors.black, FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white.withOpacity(0.5)
                                      ),
                                      child: Center(child: Icon(Icons.favorite,color: fastFoodata[index].isFav ? Colors.red : Colors.white,size: 35,)),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 80),
                                        height: 50,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white
                                        ),
                                        child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("${ms.fav[index].rating} ", style: myStyle(18, Colors.black, FontWeight.bold)),
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
                                Text("${ms.fav[index].name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,), textAlign: TextAlign.start,),
                                Text("${ms.fav[index].text}",style: TextStyle(fontSize: 16,color: Colors.black54)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}
