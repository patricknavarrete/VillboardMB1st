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
  var email, password, newpass, token;

  String em = StorageUtil.getemail() ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Column(
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
                  height: 40.0,
                ),
                Text("Old Password"),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0XFFEFF3F6),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(6, 2),
                            blurRadius: 6.0,
                            spreadRadius: 3.0),
                        BoxShadow(
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                            offset: Offset(-6, -2),
                            blurRadius: 6.0,
                            spreadRadius: 3.0)
                      ]),
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Old Password",
                      ),
                      onChanged: (val) {
                        password = val;
                      }),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text("New Password"),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0XFFEFF3F6),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(6, 2),
                            blurRadius: 6.0,
                            spreadRadius: 3.0),
                        BoxShadow(
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                            offset: Offset(-6, -2),
                            blurRadius: 6.0,
                            spreadRadius: 3.0)
                      ]),
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "NewPassword",
                      ),
                      onChanged: (val) {
                        newpass = val;
                      }),
                ),
                SizedBox(height: 25),
                Center(
                  child: ButtonTheme(
                    minWidth: 300,
                    child: RaisedButton(
                        child: Text('Submit'),
                        color: greenColorsLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 10.0,
                        onPressed: () {
                          AuthService()
                              .changepass(em, password, newpass)
                              .then((val) {
                            Fluttertoast.showToast(
                                msg: val.data['msg'],
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
