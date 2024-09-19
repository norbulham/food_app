import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/data/profile_list.dart';
import 'package:food_app/data/state_list.dart';
import 'package:food_app/manage_state.dart';
import 'package:food_app/model/profile_model.dart';
import 'package:food_app/model/state_model.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  StateModel _selectedMethod = allMethods[0];
  CityModel _selectmedthod = allCity[0];

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _showCardDetails = false;
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
                SizedBox(height: 45,),
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new, size: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 90),
                        child: Text("Add new address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)
                    )
                  ],
                ),Gap(25),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text("Full name", style: TextStyle(fontSize: 17, color: Colors.black54),)
                    ],
                  ),
                ),Gap(20),
                Padding(
                    padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: _firstNameController,
                          label: "Name",
                          hint: "Your name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                        ),Gap(27),
                        Row(
                          children: [
                            Text("Phone Number", style: TextStyle(fontSize: 17, color: Colors.black54),)
                          ],
                        ),Gap(15),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Please enter your number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your number";
                            }
                            if (value.length < 8) {
                              return "Phone Number must be at least 8 characters";
                            }
                            return null;
                          },
                        ),
                        Gap(30),
                        Row(
                          children: [
                            Text(" Select State", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DropdownButton<StateModel>(
                              value: _selectedMethod,
                              onChanged: (StateModel? newValue) {
                                setState(() {
                                  _selectedMethod = newValue!;
                                  _showCardDetails = _selectedMethod != allMethods[0];
                                });
                              },
                              items: allMethods.map<DropdownMenuItem<StateModel>>(
                                    (StateModel method) {
                                  return DropdownMenuItem<StateModel>(
                                    value: method,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage("${method.imgUrl}"), fit: BoxFit.cover),
                                          ),
                                        ),
                                        Gap(10),
                                        Text("${method.name}"),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),Gap(20),
            
                        Row(
                          children: [
                            Text(" Select City", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DropdownButton<CityModel>(
                              value: _selectmedthod,
                              onChanged: (CityModel? newValue) {
                                setState(() {
                                  _selectmedthod = newValue!;
                                  _showCardDetails = _selectmedthod != allCity[0];
                                });
                              },
                              items: allCity.map<DropdownMenuItem<CityModel>>(
                                    (CityModel method1) {
                                  return DropdownMenuItem<CityModel>(
                                    value: method1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 36,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage("${method1.imgURL}"), fit: BoxFit.cover),
                                          ),
                                        ),
                                        Gap(10),
                                        Text("${method1.cityname}"),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),Gap(70),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minWidth: MediaQuery.of(context).size.width * 0.7,
                          height: 50,
                          color: Colors.deepOrangeAccent,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              userData.add(
                                ProfileModel(
                                    email: _emailController.text.toString(),
                                    password: _passwordController.text.toString(),
                                    name: _firstNameController.text.toString(),
                                    phoneNo: _phoneController.text.toString()
                                ),
                              );
                            }
                            Get.snackbar('saving','Successfully save',titleText:Text('saving', style: myStyle(20,Colors.black, FontWeight.bold),),messageText: Text("Sucessfully save", style: myStyle(18, Colors.black),), backgroundColor: Color(0xffcaf0f8));
                            },
                          child: Text("Save", style: myStyle(23, Colors.white,FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
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