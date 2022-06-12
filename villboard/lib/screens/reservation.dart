import 'package:flutter/material.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/services/authservice.dart';

import '../services/sharedpref.dart';

class reservation extends StatefulWidget {
  reservation({Key key}) : super(key: key);
  DateTime _selectedDate;

  @override
  _reservationState createState() => _reservationState();
}

class _reservationState extends State<reservation> {
  TextEditingController controller;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  var fName = TextEditingController();
  var lName = TextEditingController();
  var address = TextEditingController();
  var pNumber = TextEditingController();
  var userEmail = TextEditingController();


  var rFirstName,
      rLastName,
      rAddress,
      rPhoneNumber,
      userId,
      venue,
      reservationTime,
      reservationDate,
      rPending,
      email;

  clearTextField (){
    setState(() {
      fName.clear();
      lName.clear();
      address.clear();
      pNumber.clear();
      userEmail.clear();

      rFirstName="";
      rLastName="";
      rAddress="";
      rPhoneNumber="";
      email="";

      venue=null;
      reservationDate= null;
      newTime = null;
      selectedDate =  DateTime.now();
      venueCheck = false;
      timeCheck = false;
    });
  }

  var store;

  bool venueCheck = false;
  bool timeCheck = false;

  submitAmenities(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Successfully Reserved'),
            content: Text(
                'You would reveice an email confirmation for your reservation'),
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
  DateTimeRangePicker dateAndTime;
  List listItem = [
    "Club House",
    "Swimming Pool",
    "Basketball Court",
  ];
  String newTime;
  List listTime = [
    "6:00am - 8:00am",
    "8:00am - 10:00am",
    "10:00am - 12:00pm",
    "12:00pm - 3:00pm",
    "3:00pm - 5:00pm",
  ];

  DateTime selectedDate = DateTime.now();
  final firstdate = DateTime(2010, 1);
  final lastdate = DateTime(2025, 1);

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
                "Reservation Form",
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
                                " Home Owner Information ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),

                              Expanded(
                                  child: Divider(color: Colors.black, thickness: 2,)
                              ),
                            ]
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: fName,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                              rFirstName = val;
                            },
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "First Name is required";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: lName,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                              rLastName = val;
                            },
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Last Name is required";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: userEmail,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: address,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                              rAddress = val;
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
                          padding: EdgeInsets.symmetric( horizontal: 10, vertical: 5),
                          child: TextFormField(
                            controller: pNumber,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                              rPhoneNumber = val;
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
                        SizedBox(height: 10,),
                        Container(
                          height: 55,
                          width: 280,
                          padding: EdgeInsets.only(left: 53, right: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DropdownButton(
                              value: venue,
                              hint: Text("Select Venue"),
                              icon: Icon(Icons.arrow_drop_down),
                              dropdownColor: Colors.white,
                              // onChanged: (val) {
                              //   venue = val;
                              // },
                              onChanged: (val) {
                                setState(() {
                                  venue = val;
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
                        venueCheck == false ? Container() :
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text("Please choose Venue",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 55,
                          width: 280,
                          padding: EdgeInsets.only(left: 53, right: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DropdownButton(
                              value: newTime,
                              hint: Text("Select Time"),
                              icon: Icon(Icons.arrow_drop_down),
                              dropdownColor: Colors.white,
                              // onChanged: (val) {
                              //   reservationTime = val;
                              // },
                              onChanged: (val) {
                                setState(() {
                                  newTime = val;
                                });
                              },
                              items: listTime.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        timeCheck == false ? Container() :
                        Text("Please choose Time",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 13),
                        ),
                        SizedBox(height: 25),
                        Text(
                          selectedDate == null
                              ? 'Please choose date of Reservation'
                              : 'Selected Date: ' +
                              '$selectedDate'.split(' ')[0],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () => _openDatePicker(context),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text("Choose Date"),
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
                              if (_form.currentState.validate() && venue != null && newTime != null) {
                                userId = await StorageUtil.get_id();
                                AuthService()
                                    .addReservation(
                                  rFirstName,
                                  rLastName,
                                  rAddress,
                                  rPhoneNumber,
                                  userId,
                                  venue,
                                  newTime,
                                  selectedDate,
                                  email,
                                  rPending,
                                )
                                    .then((val) async {
                                      if(val.data['success']){
                                        clearTextField();
                                        Fluttertoast.showToast(
                                            msg: val.data['msg'],
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
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
                                });
                              }
                              else{
                                if(venue == null){
                                    setState(() {
                                      venueCheck = true;
                                    });
                                }
                                else{
                                  setState(() {
                                    venueCheck = false;
                                  });
                                }
                                if(newTime == null){
                                  setState(() {
                                    timeCheck = true;
                                  });
                                }
                                else{
                                  setState(() {
                                    timeCheck = false;
                                  });
                                }
                              }
                              // submitAmenities(context);
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
              )
            ],
          ),
        ),
      ),
    );
  }

  _openDatePicker(BuildContext context) async {
    final dateEnd = DateTime(DateTime.now().year + 10);
    print(dateEnd);
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
        firstDate:DateTime.now(),
        lastDate: dateEnd
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
