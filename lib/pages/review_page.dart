import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/data/profile_list.dart';
import 'package:food_app/pages/checkout_page.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _NameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ms, _){
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
               SizedBox(height: 60,),
               Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(left: 20),
                       child: InkWell(
                           onTap: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CheckoutPage()));
                           },
                           child: Icon(Icons.arrow_back_ios_new))),
                   Container(
                       margin: EdgeInsets.only(left: 110),
                       child: Text("Reviews", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                   )
                 ],
               ),Gap(40),
               Padding(
                 padding: const EdgeInsets.all(10),
                 child: Column(
                   children: [
                     Container(
                       height: 60,
                       // width: MediaQuery.of(context).size.width*0.99,
                       child: Form(

                         key: _formKey,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             _buildTextField(
                               controller: _NameController,
                               label: " review",
                               hint: "Write your review",
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return "Write your review";
                                 }
                                 return null;
                               },
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),Gap(20),

               ///1st reciew
               Column(
                 children: [
                   Row(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             image: DecorationImage(image: AssetImage('assets/images/photo_6228890902617768109_y.jpg'), fit: BoxFit.cover)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: 20),
                               height: 20,
                               width: 20,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.orangeAccent
                               ),
                               child: Center(child: Text('4.8', style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),)),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Choten Wangmo", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                             Text("01/01/2020",style: TextStyle(fontSize: 16, color: Colors.black54)),
                           ],
                         ),
                       ),
                     ],
                   ),Gap(10),
                   Column(
                     children: [
                       Text("$mypara", style: TextStyle(fontSize: 15),),
                     ],
                   ),Gap(20),
                 ],
               ),
               ///2nd review
               Column(
                 children: [
                   Row(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             image: DecorationImage(image: AssetImage('assets/images/photo_6228890902617768108_x.jpg'), fit: BoxFit.cover)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: 20),
                               height: 20,
                               width: 20,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.orangeAccent
                               ),
                               child: Center(child: Text('4.4', style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),)),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Kinzang Namgay", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                             Text("03/08/2021",style: TextStyle(fontSize: 16, color: Colors.black54)),
                           ],
                         ),
                       ),
                     ],
                   ),Gap(10),
                   Column(
                     children: [
                       Text("$text2", style: TextStyle(fontSize: 15),),
                     ],
                   ),Gap(20),
                 ],
               ),
               ///3rd review
               Column(
                 children: [
                   Row(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             image: DecorationImage(image: AssetImage('assets/images/photo_6228890902617768110_y.jpg'), fit: BoxFit.cover)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: 20),
                               height: 20,
                               width: 20,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.orangeAccent
                               ),
                               child: Center(child: Text('4.7', style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),)),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Norbu Zangmo", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                             Text("18/010/2023",style: TextStyle(fontSize: 16, color: Colors.black54)),
                           ],
                         ),
                       ),
                     ],
                   ),Gap(10),
                   Column(
                     children: [
                       Text("$text3", style: TextStyle(fontSize: 15),),
                     ],
                   ),Gap(20),
                 ],
               ),
               ///forth review
               Column(
                 children: [
                   Row(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             image: DecorationImage(image: AssetImage('assets/images/photo_6228890902617768112_y.jpg'), fit: BoxFit.cover)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             Container(
                               margin: EdgeInsets.only(left: 20),
                               height: 20,
                               width: 20,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.orangeAccent
                               ),
                               child: Center(child: Text('4.2', style: TextStyle(color: Colors.white,fontSize: 11, fontWeight: FontWeight.bold),)),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(left: 20),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Ugyel Zangmo Gyeltsen", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                             Text("28/05/2024",style: TextStyle(fontSize: 16, color: Colors.black54)),
                           ],
                         ),
                       ),
                     ],
                   ),Gap(10),
                   Column(
                     children: [
                       Text("$mypara", style: TextStyle(fontSize: 15),),
                     ],
                   ),Gap(20),
                 ],
               ),
             ],
           ),
         ),
       ),
      );
    });
  }
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    IconData? suffixIcon,
    void Function()? onSuffixIconPressed,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed,
        )
            : null,
      ),
      validator: validator,
    );
  }
}
