import 'dart:async';

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
import 'package:villboard/services/color.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

import 'adminsecuPage.dart';

var loading = false;

class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var email, password, token, lastName, address, _id;

  var store;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    EasyLoading.dismiss();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Scaffold(
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeAnimation(
                            1,
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/logo_vb.png'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FadeAnimation(
                                  2,
                                  Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/leaf2.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                FadeAnimation(
                                  3,
                                  Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/leaf2.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
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
                        ],
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
                    //   loading == true ? CircularProgressIndicator(color: Colors.green,):
                    ButtonTheme(
                      minWidth: 200,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        color: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10.0,
                        onPressed: () {
                          EasyLoading.show(status: 'loading...');
                          setState(() {
                            loading = true;
                          });
                          try {
                            AuthService().login(email, password).then((val) {
                              if (val.data['success']) {
                                token = val.data['token'];
                                print(val.data);
                                AuthService().getinfo(token).then((val) async {
                                  //Printing firstName to console from Decodedtoken
                                  store = val.data['decodedtoken'];
                                  print(val.data);

                                  var iD = store['_id'];

                                  await StorageUtil.set_id(iD);

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

                                  var em = store['email'];

                                  await StorageUtil.setemail(em);

                                  var profPic = store['photoUrlProfile'];

                                  await StorageUtil.set_profilePic(profPic);

                                  if (store['petField'].isEmpty) {
                                    print('patrick');
                                  } else {
                                    var pf = store['petField'][0]['petName'];
                                    await StorageUtil.setpetField(pf);
                                    var pb = store['petField'][0]['petBreed'];
                                    await StorageUtil.setpetField(pb);
                                  }

                                  // print(store['petField'][0]['petName']);
                                  // Shared Preference
                                  if (store['role'] == "homeowners") {
                                    EasyLoading.dismiss();
                                    setState(() {
                                      loading = false;
                                    });
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard()));
                                  } else {
                                    EasyLoading.dismiss();
                                    setState(() {
                                      loading = false;
                                    });
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AdminSecuPage()));
                                  }
                                });
                              } else if (val.data == null) {
                                setState(() {
                                  loading = false;
                                });
                              }
                            });
                          } catch (e) {
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register()));
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
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        const url =
                            'https://villboard-23c49.web.app/Reset_Password';
                        if (await canLaunch(url)) launch(url);
                      },
                      // {

                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => register()));
                      // },
                      child: Container(
                        child: Text('Reset Password',
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
      ),
    );
  }
}
