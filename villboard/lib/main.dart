import 'package:flutter/material.dart';
import 'package:villboard/screens/announcement.dart';
import 'package:villboard/screens/funding.dart';
import 'package:villboard/screens/homepage.dart';
import 'package:villboard/screens/login.dart';
import 'package:villboard/screens/splashscreen.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:flutter/services.dart';

Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.init();
  
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Villboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}
