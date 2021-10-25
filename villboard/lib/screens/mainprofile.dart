import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/screens/AddFamily.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/sharedpref.dart';

class mainprofile extends StatefulWidget {
  const mainprofile({Key key}) : super(key: key);

  @override
  _mainprofileState createState() => _mainprofileState();
}

class _mainprofileState extends State<mainprofile> {
  var newfirstname, newlastname, newmiddleinitial, newaddress, newphonenumber;

  TextEditingController controller;

  editFirstName(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your First Name'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: fname,
                ),
                onChanged: (val) {
                  newfirstname = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  AuthService().changeFirstname(em, newfirstname).then((val) {
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
              )
            ],
          );
        });
  }

    editLastName(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Last Name'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: lname,
                ),
                onChanged: (val) {
                  newlastname = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  AuthService().changeLastname(em, newlastname).then((val) {
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
              )
            ],
          );
        });
  }

  editMiddleinitial(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Middle Initial'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: mname,
                ),
                onChanged: (val) {
                  newmiddleinitial = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  AuthService().changeMiddleinitial(em, newmiddleinitial).then((val) {
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
              )
            ],
          );
        });
  }

    editAddress(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Address'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ad,
                ),
                onChanged: (val) {
                  newaddress = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  AuthService().changeAddress(em, newaddress).then((val) {
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
              )
            ],
          );
        });
  }

  editPhonenumber(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Phone Number'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: pn,
                ),
                onChanged: (val) {
                  newphonenumber = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  AuthService().changePhonenumber(em, newphonenumber).then((val) {
                    Fluttertoast.showToast(
                        msg: val.data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
              )
            ],
          );
        });
  }

  String lname = StorageUtil.getlastName() ?? '';
  String mname = StorageUtil.getmiddleInitial() ?? '';
  String ad = StorageUtil.getaddress() ?? '';
  String pn = StorageUtil.getphoneNumber() ?? '';
  String fname = StorageUtil.getfirstName() ?? '';
  String em = StorageUtil.getemail() ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                      radius: 50,
                      child:
                          ClipOval(child: Image.asset('images/Profile.png'))),
                ),
                SizedBox(height: 25),
                Row(
                  children: <Widget>[
                    Text(
                      'First Name:',
                      style: GoogleFonts.ptSans(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    (SizedBox(width: 10)),
                    IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          editFirstName(context);
                        })
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  fname,
                  style: GoogleFonts.ptSans(
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Last Name:',
                      style: GoogleFonts.ptSans(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    (SizedBox(width: 10)),
                    IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          editLastName(context);
                        })
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  lname,
                  style: GoogleFonts.ptSans(
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Middle Initial:',
                      style: GoogleFonts.ptSans(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    (SizedBox(width: 10)),
                    IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          editMiddleinitial(context);
                        })
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  mname,
                  style: GoogleFonts.ptSans(
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Address:',
                      style: GoogleFonts.ptSans(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    (SizedBox(width: 10)),
                    IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          editAddress(context);
                        })
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  ad,
                  style: GoogleFonts.ptSans(
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'PhoneNumber:',
                      style: GoogleFonts.ptSans(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    (SizedBox(width: 10)),
                    IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          editPhonenumber(context);
                        })
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  pn,
                  style: GoogleFonts.ptSans(
                    fontSize: 19,
                  ),
                ),
                 SizedBox(height: 25),
                  Center(
                    child: FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: (){
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddFamily()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Add a member of the house"),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
