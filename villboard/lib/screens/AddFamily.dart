import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/services/authservice.dart';

import '../services/sharedpref.dart';


class AddFamily extends StatefulWidget {
  AddFamily({Key key}) : super(key: key);

  @override
  _AddFamilyState createState() => _AddFamilyState();
}

class _AddFamilyState extends State<AddFamily> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool membertypeCheck = false;
  bool loading = false;
  var fName = TextEditingController();
  var lName = TextEditingController();
  var address = TextEditingController();
  var pNumber = TextEditingController();
  var userEmail = TextEditingController();

  var aFirstName = "",
      aLastName = "",
      aAddress = "",
      aPhoneNumber = "",
      aEmail = "",
      userId;

  clearTextField (){
    fName.clear();
    lName.clear();
    address.clear();
    pNumber.clear();
    userEmail.clear();

    aFirstName="";
    aLastName="";
    aAddress="";
    aPhoneNumber="";
    aEmail="";
    valueChoose=null;
    membertypeCheck=false;
  }


  String valueChoose;
  List listItem = [
    "Father",
    "Mother",
    "Child",
    "Relative",
    "Helper",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Image.asset('images/addmember.png', height: 50, width: 50,),
              SizedBox(height: 10,),
              Text("Add a member of the house",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Form(
                key: _form,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                          children: <Widget>[
                            Expanded(
                                child: Divider(color: Colors.black, thickness: 2,)
                            ),

                            Text(
                              " Family Member Information ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),

                            Expanded(
                                child: Divider(color: Colors.black, thickness: 2,)
                            ),
                          ]
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          controller: fName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          onChanged: (val) {
                            aFirstName = val;
                          },
                          validator: (String val) {
                            if (val.isEmpty) {
                              return "First Name is required";
                            }
                            if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                                .hasMatch(val)) {
                              return "Please check your Last Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(Icons.person, size: 30,color: Colors.black,),
                              labelText: "First Name",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800,
                              )
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          controller: lName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          onChanged: (val) {
                            aLastName = val;
                          },
                          validator: (String val) {
                            if (val.isEmpty) {
                              return "Last Name is required";
                            }
                            if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                                .hasMatch(val)) {
                              return "Please check your Last Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(Icons.person, size: 30,color: Colors.black,),
                              labelText: "Last Name",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800,
                              )
                          ),
                        ),
                      ),
                     /* Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          controller: userEmail,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          onChanged: (val) {
                            aEmail = val;
                          },
                          validator: (String val) {
                            if (val.isEmpty) {
                              return "Email Address is required";
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(val)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(Icons.email, size: 30,color: Colors.black,),
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800,
                              )
                          ),
                        ),
                      ),*/
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          controller: address,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          onChanged: (val) {
                            aAddress = val;
                          },
                          validator: (String val) {
                            if (val.isEmpty) {
                              return "Address is required";
                            }
                            if (!RegExp(r'^([\w,:\s/.-]*)$').hasMatch(val)) {
                              return "Please check your Address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(Icons.location_on, size: 30,color: Colors.black,),
                              labelText: "Address",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800,
                              )
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          controller: pNumber,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          onChanged: (val) {
                            aPhoneNumber = "+63" + val;
                          },
                          validator: (String val) {
                            if (val.isEmpty) {
                              return "Phone is required";
                            }
                            if (!RegExp(r'^[0-9]{10}$')
                                .hasMatch(val)) {
                              return "Please check your Phone Number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(Icons.phone, size: 30,color: Colors.black,),
                              labelText: "Phone Number",
                              prefixText: '+63',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w800,
                              )
                          ),
                        ),
                      ),
                      SizedBox(height:25),
                      Container(
                        height: 55,
                        width: 280,
                        padding: EdgeInsets.only(left:53, right: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width:1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: DropdownButton(value: valueChoose,
                            underline: SizedBox(),
                            hint: Text("Select Member"),
                            icon: Icon(Icons.arrow_drop_down),
                            dropdownColor: Colors.white,
                            onChanged: (newValue){
                              setState((){
                                valueChoose = newValue;
                              });
                            },
                            items: listItem.map((valueItem){
                              return DropdownMenuItem( value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),

                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      membertypeCheck == false ? Container() :
                      Text("Please choose Member",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 13),
                      ),
                      SizedBox(height: 25),
                      loading == true ? CircularProgressIndicator(color: Colors.green,):
                      SizedBox(height: 50,width: 200,
                        child: FlatButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () async{
                            userId = await StorageUtil.get_id();
                            print(aFirstName);
                            print(aLastName);
                            print(aAddress);
                            print(aPhoneNumber);
                          //  print(aEmail);
                            print(userId);
                            print(valueChoose);
                            setState(() {
                              loading = true;
                            });
                            if (_form.currentState.validate() && valueChoose != null) {
                              setState(() {
                                membertypeCheck = false;
                              });
                              AuthService().addFamily(aFirstName, aLastName, aAddress, aPhoneNumber, valueChoose, userId) .then((val) {
                                print(val.data);
                                if(val.data['success']){
                                  clearTextField();
                                  Fluttertoast.showToast(
                                      msg: val.data['msg'],
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  setState(() {
                                      loading = false;
                                    });
                                }
                                else{
                                  Fluttertoast.showToast(
                                      msg: val.data['msg'],
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                   setState(() {
                                      loading = false;
                                    });
                                }
                              });
                            } else {
                              if(valueChoose == null){
                                setState(() {
                                  membertypeCheck = true;
                                });
                              }
                              else{
                                setState(() {
                                  membertypeCheck = false;
                                });
                              }
                              print("UnSuccessfull");
                               setState(() {
                                  loading = false;
                                });
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text("Add"),
                        ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

       

  


    