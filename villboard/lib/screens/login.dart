import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:villboard/services/FadeAnimation.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/pallete.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/screens/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/screens/registration.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var email, password, token, lastName, address;

  var store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [greenColor, greenColor],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(70)),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 400,
                    child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/leaf2.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 164,
                    width: 80,
                    height: 250,
                    child: FadeAnimation(
                      2,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/logo_vb.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(
                      3,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/leaf2.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    right: 152,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 500,
                    right: 85,
                    child: Container(
                      child: Center(
                        child: Text(
                          'Welcome to Villa Caceres',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    1.8,
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[100]),
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              onChanged: (val) {
                                email = val;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              onChanged: (val) {
                                password = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  ButtonTheme(
                    minWidth: 200,
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      color: greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 10.0,
                      onPressed: () {
                        AuthService().login(email, password).then((val) {
                          if (val.data['success']) {
                            token = val.data['token'];
                            AuthService().getinfo(token).then((val) async {
                              //Printing firstName to console from Decodedtoken
                              store = val.data['decodedtoken'];

                              var fname = store['firstName'];

                              await StorageUtil.setfirstName(fname);

                              var lname = store['lastName'];

                              await StorageUtil.setlastName(lname);

                              var mname = store['middleInitial'];

                              await StorageUtil.setmiddleInitial(mname);

                              var ad = store['address'];

                              await StorageUtil.setaddress(ad);

                              var pn = store['phoneNumber'];

                              await StorageUtil.setphoneNumber(pn);

                              var em = store ['email'];

                              await StorageUtil.setemail(em);

                                if(store['petField'].isEmpty){
                                  print('patrick');
                                } else {
                              var pf = store ['petField'][0]['petName'];
                              await StorageUtil.setpetField(pf);
                              var pb = store ['petField'][0]['petBreed'];
                              await StorageUtil.setpetField(pb);
                                }
                             

                              // print(store['petField'][0]['petName']);
                              // Shared Preference

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            });
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child: Container(
                      child: Text('Create New Account',
                          style: GoogleFonts.ptSans(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: greenColor,
                          )),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.green))),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
