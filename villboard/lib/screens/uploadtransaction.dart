import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:villboard/screens/homepage.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:villboard/services/authservice.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import '../services/authservice.dart';

class uploadtransaction extends StatefulWidget {
  uploadtransaction({Key key}) : super(key: key);

  @override
  _uploadtransactionState createState() => _uploadtransactionState();
}

class _uploadtransactionState extends State<uploadtransaction> {
  var uFirstName,
      uLastName,
      uAddress,
      uPhoneNumber,
      refNumber,
      userId,
      typeTransaction,
      proofPayment;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

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

  TextEditingController controller;

  submitTransaction(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
                Text('Successfully Uploaded Monthly Maintenance Transaction'),
            content: Text(
                'You would reveice an email confirmation for your Reference Number'),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  String valueChoose;
  List listItem = ["Bank", "Gcash"];
  DateTime _dateTime;
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
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/logo_vb.png',
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Upload Monthly Maintenance",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.receipt,
                          size: 30,
                          color: Colors.black,
                        ),
                        labelText: "Reference Number",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 50,
                  width: 260,
                  padding: EdgeInsets.only(left: 45, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: DropdownButton(
                      value: valueChoose,
                      hint: Text("Type of Transaction"),
                      icon: Icon(Icons.arrow_drop_down),
                      dropdownColor: Colors.white,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  _dateTime == null
                      ? 'Nothing has been picked yet'
                      : _dateTime.month.toString() +
                          "/" +
                          _dateTime.day.toString() +
                          "/" +
                          _dateTime.year.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: _dateTime == null
                                  ? DateTime.now()
                                  : _dateTime,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2025))
                          .then((date) {
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Date"),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      ;
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Upload Image"),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (_form.currentState.validate()) {
                        var formData = FormData.fromMap({
                          "uFirstName": uFirstName,
                          "uLastName": uLastName,
                          "uAddress": uAddress,
                          "uPhoneNumber": uPhoneNumber,
                          "refNumber": refNumber,
                          "userId": userId,
                          "typeTransaction": typeTransaction,
                          "photoUrl": photoUrl,
                          "proofPayment": proofPayment,
                          "pPending": "PENDING",
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
                                      lookupMimeType(fileName).split('/')[0],
                                      lookupMimeType(fileName).split('/')[1],
                                    ))),
                          );
                        } else {
                          formData.fields
                            ..add(MapEntry(
                              "proofPayment",
                              "",
                            ));
                          print('No Image');
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
    );
  }
}

class ImagePicker {}
