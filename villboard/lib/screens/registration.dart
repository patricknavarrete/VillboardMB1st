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

  bool valuefirst = false;
  bool valuefirstCheck = false;

  bool loading = false;
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
          radius: 62,
          backgroundColor: Colors.black,
          child: CircleAvatar(
              radius: 60,
              backgroundImage: image == null
                  ? AssetImage("images/logo.png")
                  : FileImage(File(image.path))),
        )
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

  var fName = TextEditingController();
  var lName = TextEditingController();
  var Eaddress = TextEditingController();
  var pNumber = TextEditingController();
  var iName = TextEditingController();
  var vPNumber = TextEditingController();
  var userEmail = TextEditingController();

  clearTextField() {
    fName.clear();
    lName.clear();
    Eaddress.clear();
    pNumber.clear();
    iName.clear();
    vPNumber.clear();
    userEmail.clear();
    _confirmpassword.clear();
    _password.clear();

    email = "";
    firstName = "";
    lastName = "";
    middleInitial = "";
    address = "";
    phoneNumber = "";
    password = "";
    valuefirst = false;
    valuefirstCheck = false;
    image = null;
  }

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          1,
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/logo_vb.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FadeAnimation(
                                2,
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 6,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/leaf2.png'),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'REGISTER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              FadeAnimation(
                                3,
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 6,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/leaf2.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
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
                      ],
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
                          padding: EdgeInsets.all(15),
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
                              SizedBox(
                                height: 10,
                              ),
                              imageProfile(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.photo,
                                          color: greenColor, size: 40),
                                      onPressed: () => pickImage()),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            image == null
                                                ? 'Upload Profile Picture'
                                                : '✔ Profile Picture Attached',
                                            style: TextStyle(
                                                color: image == null
                                                    ? Colors.black
                                                    : Colors.green[800],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.info,
                                                  color: Colors.blueGrey,
                                                  size: 25),
                                              onPressed: () =>
                                                  displayPicInfo()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey[100]),
                                  ),
                                ),
                                child: TextFormField(
                                  controller: userEmail,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: "Email",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    email = val;
                                  },
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      return "Email Address is required";
                                    }
                                    if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(val)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: fName,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: "First Name",
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    firstName = val;
                                  },
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      return "First Name is required";
                                    }
                                    if (RegExp(
                                            r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                                        .hasMatch(val)) {
                                      return "Please check your First Name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: lName,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: "Last Name",
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    lastName = val;
                                  },
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      return "Last Name is required";
                                    }
                                    if (RegExp(
                                            r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                                        .hasMatch(val)) {
                                      return "Please check your Last Name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: iName,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    hintText: "Middle Initial",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    middleInitial = val;
                                  },
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      return "Middle Initial is required";
                                    }
                                    if (RegExp(
                                            r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                                        .hasMatch(val)) {
                                      return "Please check your Middle Initial";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: Eaddress,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: "Address",
                                    prefixIcon: Icon(
                                      Icons.location_on,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    address = val;
                                  },
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      return "Address is required";
                                    }
                                    if (!RegExp(r'^([\w,:\s/.-]*)$')
                                        .hasMatch(val)) {
                                      return "Please check your Address";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: pNumber,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: "Phone Number",
                                    prefixText: '+63',
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                  onChanged: (val) {
                                    phoneNumber = "+63" + val;
                                  },
                                  validator: (String val) {
                                    if (val.isEmpty) {
                                      return "Phone is required";
                                    }
                                    // r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
                                    if (!RegExp(r'^[0-9]{10}$').hasMatch(val)) {
                                      return "Please check your Phone Number";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Row(children: [
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.red, width: 2.0),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: "Password",
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                    ),
                                    onChanged: (val) {
                                      password = val;
                                    },
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "Password is required";
                                      }
                                      // r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
                                      if (!RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,10}$')
                                          .hasMatch(value)) {
                                        return "Please check correct format of the password";
                                      }
                                      return null;
                                    },
                                  ),
                                )),
                                IconButton(
                                    icon: Icon(Icons.info,
                                        color: Colors.blueGrey, size: 26),
                                    onPressed: () => displayPasswordInfo()),
                              ]),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Password is required";
                                    }
                                    if (_password.text !=
                                        _confirmpassword.text) {
                                      return "Password does not match";
                                    }
                                    return null;
                                  },
                                  controller: _confirmpassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: "Confirm Password",
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.green,
                                      activeColor: Colors.white,
                                      value: valuefirst,
                                      onChanged: (bool value) {
                                        setState(() {
                                          valuefirst = value;
                                        });
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialogFunc();
                                      },
                                      child: Container(
                                        child: Text('Terms and Conditions',
                                            style: GoogleFonts.ptSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: greenColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 3,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              valuefirstCheck == false
                                  ? Container()
                                  : Column(
                                      children: [
                                        SizedBox(height: 5),
                                        Text(
                                          "Please check Terms and Condition",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 13),
                                        ),
                                      ],
                                    ),
                              SizedBox(height: 15),
                              loading == true
                                  ? CircularProgressIndicator(
                                      color: Colors.green,
                                    )
                                  : ButtonTheme(
                                      minWidth:
                                          MediaQuery.of(context).size.width -
                                              90,
                                      height: 50,
                                      child: RaisedButton(
                                          child: Text(
                                            'Register',
                                          ),
                                          textColor: Colors.white,
                                          color: greenColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          elevation: 10.0,
                                          onPressed: () async {
                                            setState(() {
                                              loading = true;
                                            });
                                            if (_form.currentState.validate() &&
                                                valuefirst != false &&
                                                image != null) {
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
                                                var fileName =
                                                    image.path.split('/').last;
                                                formData.files.add(
                                                  MapEntry(
                                                      "profilePicture",
                                                      await MultipartFile
                                                          .fromFile(image.path,
                                                              filename:
                                                                  fileName,
                                                              contentType:
                                                                  new MediaType(
                                                                lookupMimeType(
                                                                        fileName)
                                                                    .split(
                                                                        '/')[0],
                                                                lookupMimeType(
                                                                        fileName)
                                                                    .split(
                                                                        '/')[1],
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
                                                clearTextField();
                                                setState(() {
                                                  loading = false;
                                                });
                                                Fluttertoast.showToast(
                                                    msg: val.data['msg'],
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    backgroundColor:
                                                        Colors.green,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            loginscreen()));
                                              });
                                            } else {
                                              if (valuefirst == false) {
                                                setState(() {
                                                  valuefirstCheck = true;
                                                });
                                              } else {
                                                setState(() {
                                                  valuefirstCheck = false;
                                                });
                                              }
                                              if (image == null) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Profile Picture is Required",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                              print("UnSuccessfull");
                                              setState(() {
                                                loading = false;
                                              });
                                            }
                                          }),
                                    ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
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

  void displayPicInfo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            content: Text("JPEG, JPG, PNG or other Image Type"),
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
                    Text(
                      "Terms and Conditions",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please read these Terms and Conditions of Use carefully " +
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
                          "Your right to use the VillBoard Application will need to be approved by the Company and the Company may remove your right to " +
                          "use the VillBoard Application at any time by revoking your Validly Issued Login. \n ",
                      style: TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "Data Privacy \n ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "VillBoard is committed to protecting your right to privacy. We give utmost importance to data protection wherein all personal information shall be handled " +
                            "with confidentiality and security. Thus, VillBoard commits to ensure that all personal data obtained either manually or electronically. " +
                            "The Information Collected will be stored in remote third-party database (MongoDB) which is securely stored as per their privacy policy – MongoDB., Inc. is committed in protecting your privacy. \n \n" +
                            "We only collect your personal information with your knowledge and permission. All data gathered will be used for the purpose of sending information, updates",
                        style: TextStyle(fontSize: 15, height: 1.5),
                        textAlign: TextAlign.justify),
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

  void displayPasswordInfo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            content: Text(
                "Use 8 to 10 characters with a mix of letters(Uppercase at the start and Lowercase after), numbers & symbols(!@#\$&*~)"),
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
