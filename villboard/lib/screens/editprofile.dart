import 'package:flutter/material.dart';

class editprofile extends StatefulWidget {
  const editprofile({Key key}) : super(key: key);

  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
       body:Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
       child: ListView(
         children: [
           Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Edit your profile here",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900, color: Colors.green),),
                  SizedBox(height: 40.0,),
                  Text("First Name"),
                  SizedBox(height: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEFF3F6),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          offset: Offset(-6, -2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "First Name"
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Text("Last Name"),
                  SizedBox(height: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEFF3F6),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          offset: Offset(-6, -2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Last Name",
                        
                      ),
                    ),
                  ),
                   SizedBox(height: 30.0,),
                  Text("Address"),
                  SizedBox(height: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEFF3F6),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          offset: Offset(-6, -2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Address",
                        
                      ),
                    ),
                  ),
                   SizedBox(height: 30.0,),
                  Text("PhoneNumber"),
                  SizedBox(height: 10.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFEFF3F6),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          offset: Offset(-6, -2),
                          blurRadius: 6.0,
                          spreadRadius: 3.0
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        
                      ),
                    ),
                  ),
                  
                  
                  SizedBox(height: 25),

                  Row(
                    children: <Widget>[
                      Expanded(
                                          child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 16.0),)),
                    decoration: BoxDecoration(
                         color: Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(100.0),
                         boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4CAF50),
                            offset: Offset(6, 2),
                            blurRadius: 1.0,
                            spreadRadius: 2.0
                          ),
                          
                        ]
                    ),
                  ),
                      )
                    ],
                  )
                ],
              ),
         ],
       ),
     ),  
    );
  }
}
