import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/color.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class DogRegistration extends StatefulWidget {
  @override
  _DogRegistrationState createState() => _DogRegistrationState();
}

class _DogRegistrationState extends State<DogRegistration> {

  var pFirstName ="", pLastName="", pAddress="", pPhoneNumber="", petName="", petBreed="", email="", userId;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)
    );
    print(path);
  }


  Future<String> downloadQR(String qr) async{

    final qrValidationResult = QrValidator.validate(
      data: qr,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    final qrCode = qrValidationResult.qrCode;

    final painter = QrPainter.withQr(
      qr: qrCode,
      color: const Color(0xFF000000),
      gapless: true,
      embeddedImageStyle: null,
      embeddedImage: null,
    );

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    String path = '$tempPath/$ts.png';

    final picData = await painter.toImageData(2048, format: ui.ImageByteFormat.png);

    final buffer = picData.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(picData.offsetInBytes, picData.lengthInBytes)
    );


    print(path);
    return path;
  }

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
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset('images/paw.png',
                      height: 50, width: 50, color: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Register your Pet",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Form(
                      key: _form,
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Divider(color: Colors.black, thickness: 2,)
                                  ),

                                  Text(
                                    " Pet Owner Information ",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),

                                  Expanded(
                                      child: Divider(color: Colors.black, thickness: 2,)
                                  ),
                                ]
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "First Name",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "First Name is required";
                                  }
                                  if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                                      .hasMatch(val)) {
                                    return "Please check your First Name";
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  pFirstName = val;
                                  setState(() {
                                    pFirstName = pFirstName;
                                    pLastName = pLastName;
                                    pAddress = pAddress;
                                    email = email;
                                    pPhoneNumber = pPhoneNumber;
                                    petName = petName;
                                    petBreed = petBreed;
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Last Name",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  pLastName = val;
                                  setState(() {
                                    pFirstName = pFirstName;
                                    pLastName = pLastName;
                                    pAddress = pAddress;
                                    email = email;
                                    pPhoneNumber = pPhoneNumber;
                                    petName = petName;
                                    petBreed = petBreed;
                                  });
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
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Email Address",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  email = val;
                                  setState(() {
                                    pFirstName = pFirstName;
                                    pLastName = pLastName;
                                    pAddress = pAddress;
                                    email = email;
                                    pPhoneNumber = pPhoneNumber;
                                    petName = petName;
                                    petBreed = petBreed;
                                  });
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
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.location_on,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Address",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  pAddress = val;
                                  setState(() {
                                    pFirstName = pFirstName;
                                    pLastName = pLastName;
                                    pAddress = pAddress;
                                    email = email;
                                    pPhoneNumber = pPhoneNumber;
                                    petName = petName;
                                    petBreed = petBreed;
                                  });
                                },
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Address is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Phone Number",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  pPhoneNumber = val;
                                  setState(() {
                                    pFirstName = pFirstName;
                                    pLastName = pLastName;
                                    pAddress = pAddress;
                                    email = email;
                                    pPhoneNumber = pPhoneNumber;
                                    petName = petName;
                                    petBreed = petBreed;
                                  });
                                },
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Phone Number is required";
                                  }
                                  if (!RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
                                      .hasMatch(val)) {
                                    return "Please check your Phone Number";
                                  }
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(height: 5),
                            Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Divider(color: Colors.black, thickness: 2,)
                                  ),

                                  Text(
                                    " Pet Information ",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),

                                  Expanded(
                                      child: Divider(color: Colors.black, thickness: 2,)
                                  ),
                                ]
                            ),
                            SizedBox(height: 5),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.pets,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Pet Name",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  petName = val;
                                  setState(() {
                                    pFirstName = pFirstName;
                                    pLastName = pLastName;
                                    pAddress = pAddress;
                                    email = email;
                                    pPhoneNumber = pPhoneNumber;
                                    petName = petName;
                                    petBreed = petBreed;
                                  });
                                },
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Pet Name is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.pets,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Pet Breed",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  petBreed = val;
                                  setState(() {
                                    pFirstName = pFirstName;
                                    pLastName = pLastName;
                                    pAddress = pAddress;
                                    email = email;
                                    pPhoneNumber = pPhoneNumber;
                                    petName = petName;
                                    petBreed = petBreed;
                                  });
                                },
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Pet Breed is required";
                                  }
                                  return null;
                                },
                              ),
                            ),

                            pFirstName == "" || pLastName == "" || pAddress == "" || email == "" || pPhoneNumber == "" || petName == "" || petBreed == ""  ? Container() :
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Text('QR Code',
                                    style: GoogleFonts.ptSans(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: QrImage(
                                      data: "First Name: " +
                                          pFirstName +
                                          " Last Name: " +
                                          pLastName +
                                          "Email Address: " +
                                          email +
                                          "Address: " +
                                          pAddress +
                                          "Contact Number: " +
                                          pPhoneNumber +
                                          "Pet Name: " +
                                          petName +
                                          "Pet Breed: " +
                                          petBreed,
                                      version: QrVersions.auto,
                                      size: 150,
                                    )),
                                GestureDetector(
                                  onTap: ()  async{
                                    print("clicked");

                                    var qr = "First Name: " +
                                        pFirstName +
                                        " Last Name: " +
                                        pLastName +
                                        "Email Address: " +
                                        email +
                                        "Address: " +
                                        pAddress +
                                        "Contact Number: " +
                                        pPhoneNumber +
                                        "Pet Name: " +
                                        petName +
                                        "Pet Breed: " +
                                        petBreed;

                                    String path = await downloadQR(qr);

                                    final success = await GallerySaver.saveImage(path);

                                    if(success == true){
                                      Fluttertoast.showToast(
                                          msg: "QR Code saved to Gallery",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                    else{
                                      Fluttertoast.showToast(
                                          msg: "QR Code failed to save",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  },
                                  child: Container(
                                    child: Text('Download QR Code',
                                        style: GoogleFonts.ptSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        )),
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
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
                            SizedBox(height: 5),
                            /*  SizedBox(
                          height: 50,
                          width: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text("Generate QR Code"),
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                firstname = _firstname.text;
                                lastname = _lastname.text;
                                emailaddress = _emailaddress.text;
                                address = _address.text;
                                phone = _phone.text;
                                petname = _petname.text;
                                petbreed = _petbreed.text;
                              });

                              showDialogFunc(
                                  context,
                                  firstname,
                                  lastname,
                                  emailaddress,
                                  address,
                                  phone,
                                  petname,
                                  petbreed,
                                  "",
                                  "This is your QR Code for your Pet");
                            },
                          ),
                        ),*/
                            SizedBox(height: 20),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: FlatButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                onPressed: () async{
                                  userId = await StorageUtil.get_id();
                                  var qrCode = "First Name: " +
                                      pFirstName +
                                      " Last Name: " +
                                      pLastName +
                                      "Email Address: " +
                                      email +
                                      "Address: " +
                                      pAddress +
                                      "Contact Number: " +
                                      pPhoneNumber +
                                      "Pet Name: " +
                                      petName +
                                      "Pet Breed: " +
                                      petBreed;

                                  print("First Name : " + pFirstName);
                                  print("Last Name :"  +pLastName);
                                  print("Address : " +pAddress);
                                  print("Phone Number : " +pPhoneNumber);
                                  print("Pet Name : " +petName);
                                  print("Pet Breed : " +petBreed);
                                  print("Email :  " +email);
                                  print("User ID :" +userId);
                                  print("QR Code : " +qrCode);
                                  if (_form.currentState.validate()) {
                                    AuthService()
                                        .addPet(pFirstName, pLastName, pAddress,
                                        pPhoneNumber, petName, petBreed, email, userId, qrCode)
                                        .then((val) {

                                      Fluttertoast.showToast(
                                          msg: val.data['msg'],
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });
                                  } else {
                                    print("UnSuccessfull");
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text("Submit"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))));
  }
}

showDialogFunc(context, firstname, lastname, emailaddress, address, phone,
    petname, petbreed, text, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: QrImage(
                      data: "First Name: " +
                          firstname +
                          " Last Name: " +
                          lastname +
                          "Email Address: " +
                          emailaddress +
                          "Address: " +
                          address +
                          "Contact Number: " +
                          phone +
                          "Pet Name: " +
                          petname +
                          "Pet Breed: " +
                          petbreed,
                      version: QrVersions.auto,
                      size: 150,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
