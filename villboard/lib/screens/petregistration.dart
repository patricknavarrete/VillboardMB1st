import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/color.dart';

class DogRegistration extends StatelessWidget {
  const DogRegistration({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Image.asset('images/paw.png', height: 50, width: 50,),
                  SizedBox(height: 10,),
                  Text("Register your Pet",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("Pet Owner Information",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person, size: 30,color: Colors.green,),
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
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person, size: 30,color: Colors.green,),
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, size: 30,color: Colors.green,),
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.location_on, size: 30,color: Colors.green,),
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
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone, size: 30,color: Colors.green,),
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                      ),
                    ),
                  ),
                  Text("Dog Information",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.pets, size: 30,color: Colors.green,),
                        labelText: "Pet Name",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.pets, size: 30,color: Colors.green,),
                        labelText: "Pet Breed",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                      ),
                    ),
                  ),
                    SizedBox(height: 25),
                       GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      child: Text('Terms and Conditions',
                          style: GoogleFonts.ptSans(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: greenColor,
                          )),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.green))),
                    ),
                  ),
                  SizedBox(height: 50),
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
