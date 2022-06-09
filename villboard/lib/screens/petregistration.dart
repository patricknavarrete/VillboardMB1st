import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/color.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DogRegistration extends StatefulWidget {
  @override
  _DogRegistrationState createState() => _DogRegistrationState();
}

class _DogRegistrationState extends State<DogRegistration> {
  TextEditingController _firstname = TextEditingController(text: "");
  TextEditingController _lastname = TextEditingController(text: "");
  TextEditingController _emailaddress = TextEditingController(text: "");
  TextEditingController _address = TextEditingController(text: "");
  TextEditingController _phone = TextEditingController(text: "");
  TextEditingController _petname = TextEditingController(text: "");
  TextEditingController _petbreed = TextEditingController(text: "");

  String firstname = "";
  String lastname = "";
  String emailaddress = "";
  String address = "";
  String phone = "";
  String petname = "";
  String petbreed = "";

  var pFirstName, pLastName, pAddress, pPhoneNumber, petName, petBreed, email;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

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
              SizedBox(
                height: 20,
              ),
              Text(
                "Pet Owner Information",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Form(
                  key: _form,
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: _firstname,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                            onChanged: (val) {
                              pFirstName = val;
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: _lastname,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                            onChanged: (val) {
                              pLastName = val;
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: _emailaddress,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: _address,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                            onChanged: (val) {
                              pAddress = val;
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: _phone,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
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
                              pPhoneNumber = val;
                            },
                          ),
                        ),
                        Text(
                          "Pet Information",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: _petname,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
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
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: _petbreed,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
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
                            },
                          ),
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
                        SizedBox(height: 20),
                        SizedBox(
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
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: FlatButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {
                              if (_form.currentState.validate()) {
                                AuthService()
                                    .addPet(pFirstName, pLastName, pAddress,
                                        pPhoneNumber, petName, petBreed, email)
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
            ])))));
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
