import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/sharedpref.dart';

class changepassword extends StatefulWidget {
  const changepassword({Key key}) : super(key: key);

  @override
  _changepasswordState createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  var email, password, newpass, cnewpass, token;

  String em = StorageUtil.getemail() ?? '';
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: [
            Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon( Icons.lock,size: 25,color: Colors.black,),
                      SizedBox(width: 5),
                      Text("Old Password"),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(6, 2),
                              blurRadius: 3,
                              spreadRadius: 3.0),
                        ]),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Old Password",
                        ),
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Old Password is required";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          password = val;
                        }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon( Icons.lock,size: 25,color: Colors.black,),
                      SizedBox(width: 5),
                      Text("New Password"),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(6, 2),
                              blurRadius: 3,
                              spreadRadius: 3.0),
                        ]),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "New Password",
                        ),
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "New Password is required";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          newpass = val;
                        }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon( Icons.lock,size: 25,color: Colors.black,),
                      SizedBox(width: 5),
                      Text("Confirm New Password"),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(6, 2),
                              blurRadius: 3,
                              spreadRadius: 3.0),
                        ]),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm New Password",
                        ),
                        onChanged: (val) {
                          cnewpass = val;
                        },
                        validator: (String val) {
                          if (val.isEmpty) {
                            return "Confirm New Password is required";
                          }
                          if(cnewpass != newpass){
                            return "Confirm New Password and New Password is not Match";
                          }
                          return null;
                        },
                        ),
                  ),


                  SizedBox(height: 30),
                  Center(
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RaisedButton(
                          child: Text('Submit'),
                          color: Colors.green,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 10.0,
                          onPressed: () {
                            if (_form.currentState.validate()) {
                              AuthService()
                                  .changepass(em, password, newpass)
                                  .then((val) {
                                Fluttertoast.showToast(
                                    msg: val.data['msg'],
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                              });
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
