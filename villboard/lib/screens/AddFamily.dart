import 'package:flutter/material.dart';





class AddFamily extends StatefulWidget {
  AddFamily({Key key}) : super(key: key);

  @override
  _AddFamilyState createState() => _AddFamilyState();
}

class _AddFamilyState extends State<AddFamily> {
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
      body: Padding(
        padding: EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Image.asset('images/addmember.png', height: 50, width: 50,),
                  SizedBox(height: 10,),
                  Text("Add a member of the house",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("Family Member Information",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
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
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, size: 30,color: Colors.black,),
                        labelText: "Email Address",
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
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
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone, size: 30,color: Colors.black,),
                        labelText: "Phone",
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
                  SizedBox(height: 25),
                  SizedBox(height: 50,width: 200,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Add"),
                  ),)
                ],
              ),
            ),
          ),
      ),
    );
  }
}

       

  


    