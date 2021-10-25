import 'package:flutter/material.dart';

class CarRegistration extends StatelessWidget {
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
                  Image.asset('images/car.png', height: 50, width: 50,),
                  SizedBox(height: 10,),
                  Text("Register your Car",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("Car Owner Information",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
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
                  Text("Car Information",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
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
                        prefixIcon: Icon(Icons.car_rental, size: 30,color: Colors.green,),
                        labelText: "Car Model",
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
                        prefixIcon: Icon(Icons.confirmation_number, size: 30,color: Colors.green,),
                        labelText: "Plate Number",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 50,width: double.infinity,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Submit"),
                  ),)
                ],
              ),
            ),
          ),
      ),
    );
  }
}
