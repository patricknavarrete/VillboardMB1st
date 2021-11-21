import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class emergency extends StatefulWidget {
  emergency({Key key}) : super(key: key);

  @override
  _emergencyState createState() => _emergencyState();
}

class _emergencyState extends State<emergency> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.jpg"), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            centerTitle: true,
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
              padding: EdgeInsets.all(20),
              child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                          children: [
                      SizedBox(height: 0,),
                      Image.asset('images/logo_vb.png', height: 100, width: 100,),
                      SizedBox(height: 20,),
                      Text("Emergency numbers",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),),
                      SizedBox(height: 20,),
                      Text("ROVING GUARD: 543-5388", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("GATE 1 Guard: 576-3268", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("PNP HOTLINE: 302-9928", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("FIRE STATION: 534-1291", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("STA.ROSA HOSPITAL: 508-0915", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("DSWD/ MSWD: 530-0015", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("BUREAU OF FIRE PROTECTION: 534-1291", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("PHILIPPINE RED CROSS: (02) 8790-2300", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("BARANGAY EMERGENCY COVID HOTLINE: 0926 9604 714", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                      Text("BARANGAY DITA HOTLINE: 09190 801 300", textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, height: 1.5,  color: Colors.white),),
                      SizedBox(height: 20,),
                          ]
                      )
                  )
              )
          )
      ),
    );
  }
}
