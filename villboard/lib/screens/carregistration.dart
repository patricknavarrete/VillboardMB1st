import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/color.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CarRegistration extends StatefulWidget {
  @override
  _CarRegistrationState createState() => _CarRegistrationState();
}

class _CarRegistrationState extends State<CarRegistration> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  var fName = TextEditingController();
  var lName = TextEditingController();
  var address = TextEditingController();
  var pNumber = TextEditingController();
  var vModel = TextEditingController();
  var vPNumber = TextEditingController();
  var userEmail = TextEditingController();

  var loading = false;

  bool valuefirst = false;
  bool valuefirstCheck = false;

  var cFirstName = "",
      cLastName = "",
      cAddress = "",
      cPhoneNumber = "",
      vehicleModel = "",
      plateNumber = "",
      userId,
      cEmail = "";

  clearTextField() {
    fName.clear();
    lName.clear();
    address.clear();
    pNumber.clear();
    vModel.clear();
    vPNumber.clear();
    //  userEmail.clear();

    cFirstName = "";
    cLastName = "";
    cAddress = "";
    cPhoneNumber = "";
    vehicleModel = "";
    plateNumber = "";
    //   cEmail="";
    valuefirst = false;
    valuefirstCheck = false;
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
          Image.asset('images/car.png',
              height: 50, width: 50, color: Colors.green[200]),
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
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      )),
                      Text(
                        " Vehicle Owner Information ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      )),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: fName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.red, width: 2.0),
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
                          cFirstName = val;
                          setState(() {
                            cFirstName = cFirstName;
                            cLastName = cLastName;
                            cAddress = cAddress;
                            cPhoneNumber = cPhoneNumber;
                            vehicleModel = vehicleModel;
                            plateNumber = plateNumber;
                            //    cEmail = cEmail;
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
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: lName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.red, width: 2.0),
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
                          cLastName = val;
                          setState(() {
                            cFirstName = cFirstName;
                            cLastName = cLastName;
                            cAddress = cAddress;
                            cPhoneNumber = cPhoneNumber;
                            vehicleModel = vehicleModel;
                            plateNumber = plateNumber;
                            // cEmail = cEmail;
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
                    /*     Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: TextFormField(
                                controller: userEmail,
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
                            ),*/
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: address,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.red, width: 2.0),
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
                          cAddress = val;
                          setState(() {
                            cFirstName = cFirstName;
                            cLastName = cLastName;
                            cAddress = cAddress;
                            cPhoneNumber = cPhoneNumber;
                            vehicleModel = vehicleModel;
                            plateNumber = plateNumber;
                            // cEmail = cEmail;
                          });
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: pNumber,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.red, width: 2.0),
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
                          cPhoneNumber = "+63" + val;
                          setState(() {
                            cFirstName = cFirstName;
                            cLastName = cLastName;
                            cAddress = cAddress;
                            cPhoneNumber = cPhoneNumber;
                            vehicleModel = vehicleModel;
                            plateNumber = plateNumber;
                            // cEmail = cEmail;
                          });
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      )),
                      Text(
                        " Vehicle Information ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      )),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: vModel,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(
                              Icons.car_rental,
                              size: 25,
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
                            //    cEmail = cEmail;
                          });
                        },
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Vehicle Model is required";
                          }
                          if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                              .hasMatch(val)) {
                            return "Please check your Vehicle Model (Letters Only)";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: vPNumber,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(
                              Icons.car_rental_outlined,
                              size: 25,
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
                            //  cEmail = cEmail;
                          });
                        },
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Plate Number is required";
                          }
                          if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)]')
                              .hasMatch(val)) {
                            return "No special characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    /*
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
                            */

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
                              showTermandCond();
                            },
                            child: Container(
                              child: Text('Terms and Conditions',
                                  style: GoogleFonts.ptSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: greenColor,
                                    decoration: TextDecoration.underline,
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
                                style:
                                    TextStyle(color: Colors.red, fontSize: 13),
                              ),
                            ],
                          ),
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
                    SizedBox(height: 10),
                    loading == true
                        ? CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 90,
                            child: FlatButton(
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                userId = await StorageUtil.get_id();
                                var qrCode = "First Name: " +
                                    cFirstName +
                                    " Last Name: " +
                                    cLastName +
                                    " Address: " +
                                    cAddress +
                                    " Contact Number: " +
                                    cPhoneNumber +
                                    " Vehicle Model: " +
                                    vehicleModel +
                                    " Plate Number: " +
                                    plateNumber;
                                if (_form.currentState.validate() &&
                                    valuefirst != false) {
                                  AuthService()
                                      .addCar(
                                    cFirstName,
                                    cLastName,
                                    cAddress,
                                    cPhoneNumber,
                                    vehicleModel,
                                    plateNumber,
                                    userId,
                                    qrCode,
                                  )
                                      .then((val) {
                                    print(val.data);
                                    if (val.data['success']) {
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
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: val.data['msg'],
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      setState(() {
                                        loading = false;
                                      });
                                    }
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
                  ],
                ),
              ),
            ),
          ),
        ]))));
  }

  showTermandCond() {
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
