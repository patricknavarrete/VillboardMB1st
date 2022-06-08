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

  var store;

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
                  "Reservation Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Home Owner Information",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20),
                Container(
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                              onChanged: (val) {
                                rFirstName = val;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                              onChanged: (val) {
                                rLastName = val;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                              onChanged: (val) {
                                email = val;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                              onChanged: (val) {
                                rAddress = val;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                                  labelText: "Phone",
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w800,
                                  )),
                              onChanged: (val) {
                                rPhoneNumber = val;
                              },
                            ),
                          ),
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
                                value: valueChoose,
                                hint: Text("Select Venue"),
                                icon: Icon(Icons.arrow_drop_down),
                                dropdownColor: Colors.white,
                                // onChanged: (val) {
                                //   venue = val;
                                // },
                                onChanged: (val) {
                                  setState(() {
                                    venue = val;
                                    valueChoose = val;
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
                                    reservationTime = val;
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
                                if (_form.currentState.validate()) {
                                  userId = await StorageUtil.get_id();
                                  AuthService()
                                      .addReservation(
                                    rFirstName,
                                    rLastName,
                                    rAddress,
                                    rPhoneNumber,
                                    userId,
                                    venue,
                                    reservationTime,
                                    selectedDate,
                                    email,
                                    rPending,
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
      ),
    );
  }

  _openDatePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstdate,
      lastDate: lastdate,
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
