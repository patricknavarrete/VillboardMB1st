import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/FadeAnimation.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/pallete.dart';
import 'package:villboard/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/screens/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool isChecked = false;

  File image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget imageProfile() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
            radius: 60,
            backgroundImage: image == null
                ? AssetImage("images/logo.png")
                : FileImage(File(image.path)))
      ],
    );
  }

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
                    colors: [greenColor, greenColor],
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
                    height: 500,
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
                              imageProfile(),
                              IconButton(
                                  icon: Icon(Icons.photo,
                                      color: greenColor, size: 50),
                                  onPressed: () => pickImage()),
                              Container(
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
                          showDialogFunc();
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
                                  bottom: BorderSide(
                                      width: 1, color: Colors.green))),
                        ),
                      ),
                      SizedBox(height: 25),
                      ButtonTheme(
                        minWidth: 200,
                        height: 50,
                        child: RaisedButton(
                            child: Text(
                              'Register',
                            ),
                            textColor: Colors.white,
                            color: greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 10.0,
                            onPressed: () async {
                              if (_form.currentState.validate()) {
                                var formData = FormData.fromMap({
                                  "email": email,
                                  "firstName": firstName,
                                  "lastName": lastName,
                                  "middleInitial": middleInitial,
                                  "address": address,
                                  "phoneNumber": phoneNumber,
                                  "password": password
                                });

                             // adding photo to the formdata
                                if (image != null) {
                                  print('image not null');
                                  var fileName = image.path.split('/').last;
                                  formData.files.add(
                                    MapEntry(
                                        "profilePicture",
                                        await MultipartFile.fromFile(image.path,
                                            filename: fileName,
                                            contentType: new MediaType(
                                              lookupMimeType(fileName)
                                                  .split('/')[0],
                                              lookupMimeType(fileName)
                                                  .split('/')[1],
                                            ))),
                                  );
                                } else {
                                  formData.fields
                                    ..add(MapEntry(
                                      "profilePicture",
                                      "",
                                    ));
                                  print('no imageee');
                                }
                                AuthService()
                                    .addUser(
                                  formData,
                                )
                                    .then((val) async {
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

  showDialogFunc() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text("Terms and Conditions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Please read these Terms and Conditions of Use carefully " +
                        "Villboard application and our website www.villboardapp.com the application is operated by the Villa Cares – sta. rosa laguna " +
                        "your access to and use of the service is conditioned on your acceptance and compliance with these terms. These terms apply to all visitors, " +
                        "homeowners who access our mobile and web application.  \n \n" +

                        "The Villboard collect your personal information to upon registration so you can " +
                        "have access to the application “Personal Information” may include the following: " +

                        "Your Name, Home address, e-mail address, contact information" +
                        "and other information from which your identity is apparent or can be reasonably and directly ascertained. Personal data collected shall be used " +
                        "by the company and only within the mobile application, and web server. By default, user’s personal information is only shown for the user itself. " +
                        "It will be discretion of the user to make personal information visible to other user as well within the application. Only the person in charge in " +
                        "handling the admin side of the Application and Web will be the one who can be able to see your personal information. But in QR code you get when" +
                        "you registered your PET and/or VEHICLE, your information will be seen by someone who scanned the QR Code. \n \n" +

                        "They govern and apply to your access and use" +
                        "of the services offered through the VillBoard Application. By accessing or using the VillBoard Application or the Village website, you agree to comply " +
                        "with and be bound by all the Terms and Conditions described below. If you do not agree to these Terms and Conditions, you are not authorized to use the " +
                        "VillBoard Application. \n " +

                        "Your right to use the VillBoard Application will need to be approved by the Company and the Company may remove your right to "+
                        "use the VillBoard Application at any time by revoking your Validly Issued Login. \n ",
                        style: TextStyle(fontSize: 16, height: 1.5), textAlign: TextAlign.justify, ),

                        Text("Data Privacy \n ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Text("VillBoard is committed to protecting your right to privacy. We give utmost importance to data protection wherein all personal information shall be handled "+
                            "with confidentiality and security. Thus, VillBoard commits to ensure that all personal data obtained either manually or electronically. "+
                            "The Information Collected will be stored in remote third-party database (MongoDB) which is securely stored as per their privacy policy – MongoDB., Inc. is committed in protecting your privacy. \n \n" +

                            "We only collect your personal information with your knowledge and permission. All data gathered will be used for the purpose of sending information, updates",
                            style: TextStyle(fontSize: 15, height: 1.5), textAlign: TextAlign.justify),


                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                        child: Text('OK'),
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
