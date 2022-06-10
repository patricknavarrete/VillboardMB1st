import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/color.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/sharedpref.dart';

class CarRegistration extends StatefulWidget {
  @override
  _CarRegistrationState createState() => _CarRegistrationState();
}

class _CarRegistrationState extends State<CarRegistration> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  var cFirstName = "",
      cLastName = "",
      cAddress = "",
      cPhoneNumber = "",
      vehicleModel = "",
      plateNumber = "",
      userId,
      cEmail = "";


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
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset('images/car.png',
                      height: 50, width: 50, color: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Register your Vehicle",
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
                                    " Vehicle Owner Information ",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),

                                  Expanded(
                                      child: Divider(color: Colors.black, thickness: 2,)
                                  ),
                                ]
                            ),
                            SizedBox(
                              height: 20,
                            ),
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
                                onChanged: (val) {
                                  cFirstName = val;
                                  setState(() {
                                    cFirstName = cFirstName;
                                    cLastName = cLastName;
                                    cAddress = cAddress;
                                    cPhoneNumber = cPhoneNumber;
                                    vehicleModel = vehicleModel;
                                    plateNumber = plateNumber;
                                    cEmail = cEmail;
                                  });
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
                                    labelText: "Last Name",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  cLastName = val;
                                  setState(() {
                                    cFirstName = cFirstName;
                                    cLastName = cLastName;
                                    cAddress = cAddress;
                                    cPhoneNumber = cPhoneNumber;
                                    vehicleModel = vehicleModel;
                                    plateNumber = plateNumber;
                                    cEmail = cEmail;
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
                                  cEmail = val;
                                  setState(() {
                                    cFirstName = cFirstName;
                                    cLastName = cLastName;
                                    cAddress = cAddress;
                                    cPhoneNumber = cPhoneNumber;
                                    vehicleModel = vehicleModel;
                                    plateNumber = plateNumber;
                                    cEmail = cEmail;
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
                                  cAddress = val;
                                  setState(() {
                                    cFirstName = cFirstName;
                                    cLastName = cLastName;
                                    cAddress = cAddress;
                                    cPhoneNumber = cPhoneNumber;
                                    vehicleModel = vehicleModel;
                                    plateNumber = plateNumber;
                                    cEmail = cEmail;
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
                                      Icons.phone,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Phone",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  cPhoneNumber = val;
                                  setState(() {
                                    cFirstName = cFirstName;
                                    cLastName = cLastName;
                                    cAddress = cAddress;
                                    cPhoneNumber = cPhoneNumber;
                                    vehicleModel = vehicleModel;
                                    plateNumber = plateNumber;
                                    cEmail = cEmail;
                                  });
                                },
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Phone is required";
                                  }
                                  if (!RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
                                      .hasMatch(val)) {
                                    return "Please check your Phone Number";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Divider(color: Colors.black, thickness: 2,)
                                  ),

                                  Text(
                                    " Vehicle Information ",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),

                                  Expanded(
                                      child: Divider(color: Colors.black, thickness: 2,)
                                  ),
                                ]
                            ),
                            SizedBox(
                              height: 20,
                            ),
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
                                      Icons.car_rental,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Vehicle Model",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  vehicleModel = val;
                                  setState(() {
                                    cFirstName = cFirstName;
                                    cLastName = cLastName;
                                    cAddress = cAddress;
                                    cPhoneNumber = cPhoneNumber;
                                    vehicleModel = vehicleModel;
                                    plateNumber = plateNumber;
                                    cEmail = cEmail;
                                  });
                                },
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Vehicle Model is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
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
                                      Icons.car_rental_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    labelText: "Plate Number",
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w800,
                                    )),
                                onChanged: (val) {
                                  plateNumber = val;
                                  setState(() {
                                    cFirstName = cFirstName;
                                    cLastName = cLastName;
                                    cAddress = cAddress;
                                    cPhoneNumber = cPhoneNumber;
                                    vehicleModel = vehicleModel;
                                    plateNumber = plateNumber;
                                    cEmail = cEmail;
                                  });
                                },
                                validator: (String val) {
                                  if (val.isEmpty) {
                                    return "Plate Number is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
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
                                      cFirstName +
                                      " Last Name: " +
                                      cLastName +
                                      "Email Address: " +
                                      cEmail +
                                      "Address: " +
                                      cAddress +
                                      "Contact Number: " +
                                      cPhoneNumber +
                                      "Vehicle Modal: " +
                                      vehicleModel +
                                      "Plate Number: " +
                                      plateNumber,
                                  version: QrVersions.auto,
                                  size: 150,
                                )),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Text('Terms and Conditions',
                                    style: GoogleFonts.ptSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: greenColor,
                                    )),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.green))),
                              ),
                            ),
                            SizedBox(height: 20),
                            /*   SizedBox(
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
                                vehiclemodel = _vehiclemodel.text;
                                vehicleplate = _vehicleplate.text;
                              });

                              showDialogFunc(
                                  context,
                                  firstname,
                                  lastname,
                                  emailaddress,
                                  address,
                                  phone,
                                  vehiclemodel,
                                  vehicleplate,
                                  "",
                                  "This is your QR Code for your Vehicle");
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
                                      cFirstName +
                                      " Last Name: " +
                                      cLastName +
                                      "Email Address: " +
                                      cEmail +
                                      "Address: " +
                                      cAddress +
                                      "Contact Number: " +
                                      cPhoneNumber +
                                      "Vehicle Modal: " +
                                      vehicleModel +
                                      "Plate Number: " +
                                      plateNumber;
                                  if (_form.currentState.validate()) {
                                    AuthService()
                                        .addCar(
                                      cFirstName,
                                      cLastName,
                                      cAddress,
                                      cPhoneNumber,
                                      vehicleModel,
                                      plateNumber,
                                      cEmail,
                                      userId,
                                      qrCode,
                                    )
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
    vehiclemodel, vehicleplate, text, desc) {
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
                          "Vehicle Modal: " +
                          vehiclemodel +
                          "Plate Number: " +
                          vehicleplate,
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
