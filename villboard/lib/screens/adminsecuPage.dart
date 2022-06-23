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

import 'login.dart';

var loading = false;
String em = StorageUtil.getemail() ?? '';

class AdminSecuPage extends StatefulWidget {
  @override
  _AdminSecuPageState createState() => _AdminSecuPageState();
}

class _AdminSecuPageState extends State<AdminSecuPage> {

  Timer _timer;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        EasyLoading.show(status: 'loading...');
        try{
          AuthService().logout(em).then((val) async {
            EasyLoading.dismiss();
            Fluttertoast.showToast(
                msg: val.data['msg'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);

            SharedPreferences preference = await SharedPreferences.getInstance();
            preference.clear();

            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => loginscreen()));
          });
        }
        catch(e){
          EasyLoading.dismiss();
          setState(() {
            loading = false;
          });
        }
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        home: Scaffold(
          backgroundColor: Palette.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
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
                      SizedBox(height: 20,),
                      Container(
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeAnimation(
                            1,
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width/3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/logo_vb.png'),
                                  ),
                                ),
                              ),
                          ),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width-100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FadeAnimation(
                                    2,
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width/6,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('images/leaf2.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ooopss..',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FadeAnimation(
                                    3,
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width/6,
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
                            Container(
                              child: Center(
                                child: Text(
                                  '',
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: Text(
                          'Admin/Security account can only use the Web Apllication of Villboard.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 200,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          'Okay',
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
                          try{
                            AuthService().logout(em).then((val) async {
                              EasyLoading.dismiss();
                              Fluttertoast.showToast(
                                  msg: val.data['msg'],
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                              SharedPreferences preference = await SharedPreferences.getInstance();
                              preference.clear();

                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => loginscreen()));
                            });
                          }
                          catch(e){
                            EasyLoading.dismiss();
                            setState(() {
                              loading = false;
                            });
                          }

                        },
                      ),
                    ),
                  ],
                ),
            ]),
          ),
        ),
      ),
    );
  }
}
