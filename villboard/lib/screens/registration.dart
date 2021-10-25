import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/FadeAnimation.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/pallete.dart';
import 'package:villboard/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/screens/login.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool isChecked = false;

  var email,
      firstName,
      lastName,
      middleInitial,
      address,
      phoneNumber,
      password,
      token;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [greenColor, greenColorsLight],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(70)),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 400,
                    child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/leaf2.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 170,
                    width: 80,
                    height: 250,
                    child: FadeAnimation(
                      2,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/logo_vb.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(
                      3,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/leaf2.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    right: 104,
                    child: Container(
                      child: Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 465,
                    right: 65,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Welcome New Home Owner',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Form(
                key: _form,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]),
                                  ),
                                ),
                                child: TextFormField(
                                  validator: (String value) {
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return 'Please a valid Email';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    email = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String value) {
                                    if (!RegExp(r"^[a-z A-Z]+$")
                                        .hasMatch(value)) {
                                      return 'Please a valid First Name';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "First Name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    firstName = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String value) {
                                    if (!RegExp(r"^[a-z A-Z]+$")
                                        .hasMatch(value)) {
                                      return 'Please a valid Last Name';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Last Name",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    lastName = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String value) {
                                    if (!RegExp(r"^[a-z A-Z]{1}$")
                                        .hasMatch(value)) {
                                      return 'Please a valid Middle Initial';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Middle Initial",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    middleInitial = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Address",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    address = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String value) {
                                    if (!RegExp(r'^(?:[+0]9)?[0-9]{11}$')
                                        .hasMatch(value)) {
                                      return 'Please a valid Phone Number';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    phoneNumber = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    password = val;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String value) {
                                    if (_password.text != _confirmpassword.text)
                                      return "Password does not match";
                                  },
                                  controller: _confirmpassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                            ],
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
                  SizedBox(height: 25),
                      ButtonTheme(
                        minWidth: 300,
                        child: RaisedButton(
                            child: Text('Register'),
                            color: greenColorsLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 10.0,
                            onPressed: () {
                              if (_form.currentState.validate()) {
                                AuthService()
                                    .addUser(
                                        email,
                                        firstName,
                                        lastName,
                                        middleInitial,
                                        address,
                                        phoneNumber,
                                        password)
                                    .then((val) {
                                  Fluttertoast.showToast(
                                      msg: val.data['msg'],
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => loginscreen()));
                                });
                              } else {
                                print("UnSuccessfull");
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void displayMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            content: Text("You have accepted the terms."),
            actions: [
              FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
          return dialog;
        });
  }
}
