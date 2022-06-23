import 'package:flutter/material.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/services/authservice.dart';
import 'package:intl/intl.dart';
import '../services/sharedpref.dart';
import 'package:date_field/date_field.dart';

List<String> unselectableDates = [];

List<Reserve> reserveList = [];

class Reserve {
  final String venue;
  final String reservationTime;
  final String reservationDate;

  Reserve({
    this.venue,
    this.reservationTime,
    this.reservationDate,
  });
}

bool availability = false;

class reservation extends StatefulWidget {
  reservation({Key key}) : super(key: key);
  DateTime _selectedDate;

  @override
  _reservationState createState() => _reservationState();
}

class _reservationState extends State<reservation> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    getTimeData();

    //      "6:00am - 8:00am",
//      "8:00am - 10:00am",
//      "10:00am - 12:00pm",
//      "12:00pm - 3:00pm",
//      "3:00pm - 5:00pm",

  }

  Future<void> getTimeData (){
    AuthService().getApprovedReservation().then((val) async {
      unselectableDates.clear();
      reserveList.clear();

      for (int x = 0; x < val.data.length; x++) {
        var temp = val.data[x];
        DateTime newDate = DateTime.parse(val.data[x]['reservationDate']);
        String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
        String dateNoww = DateFormat('yyyy-M-dd').format(DateTime.now());

        setState(() {
          reserveList.add(new Reserve(
            venue: temp['venue'],
            reservationDate: formattedDate,
            reservationTime: temp['reservationTime'],
          ));
        });

        print(reserveList[x].venue + reserveList[x].reservationDate +
            reserveList[x].reservationTime);
        /* if(temp['venue'] == "Clubhouse" || temp['venue'] == "Club House" && formattedDate == dateNoww &&  temp['reservationTime'] == "6:00am - 8:00am"){

          unselectableDates.add(formattedDate);
        }*/
      }
    });
  }

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  var fName = TextEditingController();
  var lName = TextEditingController();
  var address = TextEditingController();
  var pNumber = TextEditingController();
  var userEmail = TextEditingController();

  var loading = false;
  String check = "";

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

  clearTextField() {
    setState(() {
      fName.clear();
      lName.clear();
      address.clear();
      pNumber.clear();
      userEmail.clear();

      rFirstName = "";
      rLastName = "";
      rAddress = "";
      rPhoneNumber = "";
      email = "";

      venue = null;
      reservationDate = null;
      newTime = null;
      selectedDate = DateTime.now();
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
    "Volleyball Court",
  ];
  String newTime;

  List listTime = [
    "6:00am - 8:00am",
    "8:00am - 10:00am",
    "10:00am - 12:00pm",
    "12:00pm - 3:00pm",
    "3:00pm - 5:00pm",
  ];

  List listTimeFull = [
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
                                  child: Divider(
                                    color: Colors.black, thickness: 2,)
                              ),

                              Text(
                                " Home Owner Information ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),

                              Expanded(
                                  child: Divider(
                                    color: Colors.black, thickness: 2,)
                              ),
                            ]
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: fName,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: lName,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                        /*  Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: userEmail,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                        ),*/
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: address,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                              rAddress = val;
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            controller: pNumber,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                              rPhoneNumber = "+63" + val;
                            },
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Phone Number is required";
                              }
                              if (!RegExp(r'^[0-9]{10}$')
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
                          width: MediaQuery.of(context).size.width - 90,
                          padding: EdgeInsets.only(left: 53, right: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: venue,
                              hint: Text("Select Venue"),
                              icon: Icon(Icons.arrow_drop_down),
                              dropdownColor: Colors.white,
                              onChanged: (val) {
                                setState(() {
                                  venue = val;
                                  check = "";
                                  newTime = null;

                                  unselectableDates.clear();
                                  int reserveTimeGetCH = 0;

                                  //      "6:00am - 8:00am",
                                  //      "8:00am - 10:00am",
                                  //      "10:00am - 12:00pm",
                                  //      "12:00pm - 3:00pm",
                                  //      "3:00pm - 5:00pm",

                                  List<String> dateArr = [];
                                  for (int x = 0; x < reserveList.length; x++) {
                                    dateArr.add(reserveList[x].reservationDate);
                                  }
                                  dateArr = dateArr.toSet().toList();
                                  print(dateArr);

                                  for (int n = 0; n < dateArr.length; n++) {
                                    for (int x = 0; x < reserveList.length; x++) {
                                      var temp = reserveList[x];
                                      setState(() {
                                        if (temp.venue == val) {
                                          if (temp.reservationDate == dateArr[n] && temp.reservationTime == "6:00am - 8:00am") {
                                            setState(() {
                                              reserveTimeGetCH++;
                                            });
                                          }
                                          else if (temp.reservationDate == dateArr[n] &&  temp.reservationTime == "8:00am - 10:00am") {
                                            setState(() {
                                              reserveTimeGetCH++;
                                            });
                                          }
                                          else if (temp.reservationDate == dateArr[n] && temp.reservationTime == "10:00am - 12:00pm") {
                                            setState(() {
                                              reserveTimeGetCH++;
                                            });
                                          }
                                          else if (temp.reservationDate == dateArr[n] && temp.reservationTime == "12:00pm - 3:00pm") {
                                            setState(() {
                                              reserveTimeGetCH++;
                                            });
                                          }
                                          else if (temp.reservationDate == dateArr[n] && temp.reservationTime == "3:00pm - 5:00pm") {
                                            setState(() {
                                              reserveTimeGetCH++;
                                            });
                                          }

                                          if (reserveTimeGetCH >= 5) {
                                            setState(() {
                                              unselectableDates.add(dateArr[n]);
                                              reserveTimeGetCH = 0;
                                            });
                                          }
                                        }
                                        print(val + " reserved : " + dateArr[n].toString() + " SELECTED DATE : " + DateFormat('yyyy-MM-dd').format(selectedDate).toString());
                                      });
                                    }
                                  }

                                  List<String> newTimeList = [];
                                  newTimeList.clear();
                                  for(int x = 0; x < reserveList.length; x++){
                                    var temp = reserveList[x];

                                    if(temp.venue == val){
                                      if(temp.reservationDate == DateFormat('yyyy-MM-dd').format(selectedDate).toString()){
                                        if(temp.reservationTime == "6:00am - 8:00am" && !newTimeList.contains("6:00am - 8:00am")){
                                          setState(() {
                                            newTimeList.add("6:00am - 8:00am");
                                          });
                                        }
                                        if(temp.reservationTime == "8:00am - 10:00am" && !newTimeList.contains("8:00am - 10:00am")){
                                          setState(() {
                                            newTimeList.add("8:00am - 10:00am");
                                          });
                                        }
                                        if(temp.reservationTime == "8:00am - 10:00am" && !newTimeList.contains("8:00am - 10:00am")){
                                          setState(() {
                                            newTimeList.add("8:00am - 10:00am");
                                          });
                                        }
                                        if(temp.reservationTime == "10:00am - 12:00pm" && !newTimeList.contains("10:00am - 12:00pm")){
                                          setState(() {
                                            newTimeList.add("10:00am - 12:00pm");
                                          });
                                        }
                                        if(temp.reservationTime == "12:00pm - 3:00pm" && !newTimeList.contains("12:00pm - 3:00pm")){
                                          setState(() {
                                            newTimeList.add("12:00pm - 3:00pm");
                                          });
                                        }
                                        if(temp.reservationTime == "3:00pm - 5:00pm" && !newTimeList.contains("3:00pm - 5:00pm")){
                                          setState(() {
                                            newTimeList.add("3:00pm - 5:00pm");
                                          });
                                        }
                                      }
                                    }
                                  }

                                  print(newTime.toString() + " DATE  ");
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                                  if(unselectableDates.contains(formattedDate)){
                                    setState(() {
                                      availability = true;
                                      newTime = null;
                                      timeCheck = false;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      availability = false;
                                      timeCheck = false;
                                      //listTime = newTime;
                                     // listTime = listTime.toSet().toList();
                                      if(newTimeList.isEmpty){
                                        listTime = listTimeFull;
                                      }
                                      else{
                                        for(int x = 0; x<newTimeList.length; x++){
                                          listTime.remove(newTimeList[x]);
                                        }
                                      }
                                      listTime = listTime.toSet().toList();
                                    });
                                  }
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
                        availability == false ? Container() :
                        Container(
                          child: Text("$venue is not available for the selected date.\n (No Slot Available)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13),
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
                        availability != false ? Container() :
                        Column(
                          children: [
                            Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width - 90,
                              padding: EdgeInsets.only(left: 53, right: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: DropdownButton(
                                  underline: SizedBox(),
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
                          ],
                        ),
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
                          width: MediaQuery .of(context).size.width - 90,
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
                        loading == true ? Column(
                          children: [
                            CircularProgressIndicator(color: Colors.green,),
                            SizedBox(height: 10,),
                            Text("Checking Availability. Please wait.."),
                          ],
                        ) :
                        SizedBox(
                          height: 50,
                          width: MediaQuery .of(context).size.width - 90,
                          child: FlatButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              if (_form.currentState.validate() && venue != null && newTime != null) {
                                userId = await StorageUtil.get_id();
                                String email = StorageUtil.getemail() ?? '';
                                int reserved = 0;

                                DateTime now = DateTime.now();
                                String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

                                AuthService().postReservation().then((
                                    val) async {
                                  for (int x = 0; x < val.data.length; x++) {
                                    print(x);
                                    String getDate = val.data[x]['reservationDate'];
                                    List split = getDate.split("T");
                                    print(split[0] + "  " + formattedDate +  val.data[x]['reservationTime'] + newTime + val.data[x]['rPending'] + val.data[x]['venue'] + venue);
                                    if (val.data[x]['reservationTime'] == newTime && split[0] == formattedDate && val.data[x]['rPending'] == "approved" && val.data[x]['venue'] == venue) {
                                      setState(() {
                                        reserved++;
                                      });
                                    }
                                  }
                                  print("done checking..");
                                  print(reserved);
                                  if (reserved != 0) {
                                    getTimeData();
                                    Fluttertoast.showToast(
                                        msg: "Requested type of accommodation is not available",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    setState(() {
                                      loading = false;
                                      newTime = null;
                                    });
                                  }
                                  else {
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
                                      rPending,
                                      email,
                                    ).then((val) async {
                                      if (val.data['success']) {
                                        clearTextField();
                                        getTimeData();
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
                                      else {
                                        setState(() {
                                          loading = false;
                                          newTime = null;
                                        });
                                        getTimeData();
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
                                });
                              }

                              else {
                                if (venue == null) {
                                  setState(() {
                                    venueCheck = true;
                                  });
                                }
                                else {
                                  setState(() {
                                    venueCheck = false;
                                  });
                                }
                                if (newTime == null) {
                                  setState(() {
                                    timeCheck = true;
                                  });
                                }
                                else {
                                  setState(() {
                                    timeCheck = false;
                                  });
                                }
                                setState(() {
                                  loading = false;
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
    );
  }

  _openDatePicker(BuildContext context) async {
    final dateEnd = DateTime(DateTime.now().year + 10);

    var dateNowPlus1 = new DateTime.now();
    var newDate = new DateTime(dateNowPlus1.year, dateNowPlus1.month, dateNowPlus1.day + 1);

    var newDate2 = new DateTime(dateNowPlus1.year, dateNowPlus1.month, dateNowPlus1.day);

    print(unselectableDates);
    final DateTime date = await showDatePicker(
        context: context,
      initialDate: selectedDate,
        /*initialDate: unselectableDates.isEmpty
            ? selectedDate
            : !unselectableDates.contains(selectedDate)
            ? newDate
            : selectedDate,*/
        firstDate: newDate2,
        lastDate: dateEnd,
      /*  selectableDayPredicate: (DateTime val) {
          String sanitized = DateFormat('yyyy-MM-dd').format(val);
          return !unselectableDates.contains(sanitized);
        }
*/
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
        newTime = null;
        unselectableDates.clear();

        int reserveTimeGetCH = 0;
        int reserveTimeGetSP = 0;
        int reserveTimeGetVC = 0;
        int reserveTimeGetBC = 0;

        //      "6:00am - 8:00am",
        //      "8:00am - 10:00am",
        //      "10:00am - 12:00pm",
        //      "12:00pm - 3:00pm",
        //      "3:00pm - 5:00pm",

        List<String> dateArr = [];
        for (int x = 0; x < reserveList.length; x++) {
          dateArr.add(reserveList[x].reservationDate);
        }
        dateArr = dateArr.toSet().toList();
        print(dateArr);

        for (int n = 0; n < dateArr.length; n++) {
          for (int x = 0; x < reserveList.length; x++) {
            var temp = reserveList[x];

            setState(() {
              if (temp.venue == venue) {
                if (temp.reservationDate == dateArr[n] && temp.reservationTime == "6:00am - 8:00am") {
                  setState(() {
                    reserveTimeGetCH++;
                  });
                }
                else if (temp.reservationDate == dateArr[n] &&  temp.reservationTime == "8:00am - 10:00am") {
                  setState(() {
                    reserveTimeGetCH++;
                  });
                }
                else if (temp.reservationDate == dateArr[n] && temp.reservationTime == "10:00am - 12:00pm") {
                  setState(() {
                    reserveTimeGetCH++;
                  });
                }
                else if (temp.reservationDate == dateArr[n] && temp.reservationTime == "12:00pm - 3:00pm") {
                  setState(() {
                    reserveTimeGetCH++;
                  });
                }
                else if (temp.reservationDate == dateArr[n] && temp.reservationTime == "3:00pm - 5:00pm") {
                  setState(() {
                    reserveTimeGetCH++;
                  });
                }

                if (reserveTimeGetCH >= 5) {
                  setState(() {
                    unselectableDates.add(dateArr[n]);
                    reserveTimeGetCH = 0;
                  });
                }
              }
              print(venue + " reserved : " + reserveTimeGetCH.toString());

            });
          }
        }

        List<String> newTimeList = [];
        newTimeList.clear();
        for(int x = 0; x < reserveList.length; x++){
          var temp = reserveList[x];

          if(temp.venue == venue){
            if(temp.reservationDate == DateFormat('yyyy-MM-dd').format(selectedDate).toString()){
              if(temp.reservationTime == "6:00am - 8:00am" && !newTimeList.contains("6:00am - 8:00am")){
                setState(() {
                  newTimeList.add("6:00am - 8:00am");
                });
              }
              if(temp.reservationTime == "8:00am - 10:00am" && !newTimeList.contains("8:00am - 10:00am")){
                setState(() {
                  newTimeList.add("8:00am - 10:00am");
                });
              }
              if(temp.reservationTime == "8:00am - 10:00am" && !newTimeList.contains("8:00am - 10:00am")){
                setState(() {
                  newTimeList.add("8:00am - 10:00am");
                });
              }
              if(temp.reservationTime == "10:00am - 12:00pm" && !newTimeList.contains("10:00am - 12:00pm")){
                setState(() {
                  newTimeList.add("10:00am - 12:00pm");
                });
              }
              if(temp.reservationTime == "12:00pm - 3:00pm" && !newTimeList.contains("12:00pm - 3:00pm")){
                setState(() {
                  newTimeList.add("12:00pm - 3:00pm");
                });
              }
              if(temp.reservationTime == "3:00pm - 5:00pm" && !newTimeList.contains("3:00pm - 5:00pm")){
                setState(() {
                  newTimeList.add("3:00pm - 5:00pm");
                });
              }
            }
          }
        }

        print(newTimeList.toString() + " DATE  ");
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        if(unselectableDates.contains(formattedDate)){
          setState(() {
            availability = true;
            newTime = null;
            timeCheck = false;
          });
        }
        else{
          setState(() {
            availability = false;
            timeCheck = false;
            //listTime = newTime;
            // listTime = listTime.toSet().toList();
            if(newTimeList.isEmpty){
              listTime = listTimeFull;
            }
            else{
              for(int x = 0; x<newTimeList.length; x++){
                listTime.remove(newTimeList[x]);
              }
            }
            listTime = listTime.toSet().toList();
          });
        }
      });
    }
  }
}
