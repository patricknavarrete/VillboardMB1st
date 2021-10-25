import 'package:flutter/material.dart';
import 'dart:async';
import 'package:villboard/screens/login.dart';


class splashscreen extends StatefulWidget {
  splashscreen({Key key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: initScreen(context),
    );
  }
  startTime() async {
  var duration = new Duration(seconds: 10);
  return new Timer(duration, route);
}
route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => loginscreen()
      )
    ); 
  }
  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/villboard.gif"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Splash Screen",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
           )
         ],
       ),
      ),
    );
  }
}
