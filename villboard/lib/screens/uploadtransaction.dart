import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:villboard/screens/homepage.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:villboard/services/authservice.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import '../services/authservice.dart';
import '../services/sharedpref.dart';

class uploadtransaction extends StatefulWidget {
  uploadtransaction({Key key}) : super(key: key);

  @override
  _uploadtransactionState createState() => _uploadtransactionState();
}

class _uploadtransactionState extends State<uploadtransaction> {

  var fName = TextEditingController();
  var lName = TextEditingController();
  var address = TextEditingController();
  var pNumber = TextEditingController();
  var rNumber = TextEditingController();
  var userEmail = TextEditingController();

  var uFirstName,
      uLastName,
      uAddress,
      uPhoneNumber,
      uEmailAdress,
      refNumber,
      userId,
      typeTransaction,
      proofPayment;

  var loading = false;

  clearTextField (){
    setState(() {
      fName.clear();
      lName.clear();
      address.clear();
      pNumber.clear();
      rNumber.clear();
      userEmail.clear();

      uFirstName="";
      uLastName="";
      uAddress="";
      uPhoneNumber="";
      uEmailAdress="";
      refNumber="";
      proofPayment="";
      image = null;
      typeTransaction=null;

      imageCheck = false;
      typeTransactionCheck = false;
    });
  }



  bool typeTransactionCheck = false;
  bool imageCheck = false;

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
      body:  Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/logo_vb.png',
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Upload Monthly Maintenance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: fName,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w800,
                                  )),
                              onChanged: (val) {
                                uFirstName = val;
                              },
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
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: lName,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w800,
                                  )),
                              onChanged: (val) {
                                uLastName = val;
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
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: address,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border:  new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  labelText: "Address",
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w800,
                                  )),
                              onChanged: (val) {
                                uAddress = val;
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
                            ),
                          ),
                      /*    Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: userEmail,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border:  new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  labelText: "Email Address",
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w800,
                                  )),
                              onChanged: (val) {
                                uEmailAdress = val;
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
                          ),*/
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: pNumber,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border:  new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  labelText: "Phone Number",
                                  prefixText: '+63',
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w800,
                                  )),
                              onChanged: (val) {
                                uPhoneNumber = "+63" + val;
                              },
                              validator: (String val) {
                                if (val.isEmpty) {
                                  return "Phone Number is required";
                                }
                                // r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
                                if (!RegExp(r'^[0-9]{10}$')
                                    .hasMatch(val)) {
                                  return "Please check your Phone Number";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: rNumber,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border:  new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.receipt,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  labelText: "Reference Number",
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w800,
                                  )),
                              onChanged: (val) {
                                refNumber = val;
                              },
                              validator: (String val) {
                                if (val.isEmpty) {
                                  return "Reference Number is required";
                                }
                                if(typeTransaction == "Bank"){
                                  if (!RegExp(r'^([a-zA-Z0-9]){0,30}$')
                                      .hasMatch(val)) {
                                    return "Please check your Reference Number";
                                  }
                                }
                                if(typeTransaction == "Gcash"){
                                  if (!RegExp(r'^([a-zA-Z0-9]){0,13}$')
                                      .hasMatch(val)) {
                                    return "Please check your Reference Number";
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width-90,
                            padding: EdgeInsets.only(left: 35, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: DropdownButton(
                                underline: SizedBox(),
                                value: typeTransaction,
                                hint: Text("Type of Transaction"),
                                icon: Icon(Icons.arrow_drop_down),
                                dropdownColor: Colors.white,
                                onChanged: (newValue) {
                                  setState(() {
                                    typeTransaction = newValue;
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
                          SizedBox(height: 10),
                          typeTransactionCheck == false ? Container() :
                          Text("Please choose Type of Transaction",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12),
                          ),
                          SizedBox(height: 20),
                          /*   Text(
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
                                final date = DateTime(DateTime.now().year + 10);
                                print(date);
                                showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null
                                        ? DateTime.now()
                                        : _dateTime,
                                    firstDate:DateTime.now(),
                                    lastDate: date)
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
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                image == null
                                    ? 'Attach Proof of Payment'
                                    : '✔ Proof of Payment Attached',
                                style: TextStyle(
                                    color: image == null ? Colors.black : Colors.green[800] ,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              IconButton(
                                  icon: Icon(Icons.info,
                                      color: Colors.blueGrey, size: 25),
                                  onPressed: () => displayPicInfo()),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width-90,
                            child: FlatButton(
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () {
                                pickImage();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text("Upload Image"),
                            ),
                          ),
                          imageCheck == false ? Container() :
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Text("Please upload Proof of Payment",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                        ],
                      )
                  ),
                ),

                loading == true ? CircularProgressIndicator(color: Colors.green,):
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width-90,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {
                      String email = StorageUtil.getemail() ?? '';
                      setState(() {
                        loading = true;
                      });

                      userId = await StorageUtil.get_id();

                      print(uFirstName);
                      print(uLastName);
                      print(uAddress);
                      print(uPhoneNumber);
                      print(refNumber);
                      print(userId);
                      print(typeTransaction);

                      if (_form.currentState.validate() && typeTransaction != null && image != null) {
                        var formData = FormData.fromMap({
                          "uFirstName": uFirstName,
                          "uLastName": uLastName,
                          "uAddress": uAddress,
                          "uPhoneNumber": uPhoneNumber,
                          "refNumber": refNumber,
                          "userId": userId,
                          "typeTransaction": typeTransaction,
                          "pPending": "PENDING",
                          "email": email,
                        });

                        // adding photo to the formdata
                        if (image != null) {
                          print('image not null');
                          var fileName = image.path.split('/').last;
                          print(fileName);
                          formData.files.add(
                            MapEntry(
                                "proofPayment",
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
                        AuthService().addPayment(formData).then((val) async {
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
                          }
                          setState(() {
                            loading = false;
                          });
                        });
                      } else {
                        if(typeTransaction == null){
                          setState(() {
                            typeTransactionCheck = true;
                          });
                        }
                        else{
                          setState(() {
                            typeTransactionCheck = false;
                          });
                        }
                        if(image == null){
                          setState(() {
                            imageCheck = true;
                          });
                        }
                        else{
                          setState(() {
                            imageCheck = false;
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
                    child: Text("Submit"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
}

