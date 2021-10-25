import 'package:flutter/material.dart';

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
          title: Text('Emergency Numbers'),
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.lightGreenAccent,
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
          padding: EdgeInsets.all(25),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Image.asset('images/logo_vb.png', height: 50, width: 50,),
                    SizedBox(height: 10,),
                    Text("Emergency numbers",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("Roving Guard: 543-5388",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("GATE 1 Guard: 576-3268",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("PNP HOTLINE: 302-9928",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("FIRE STATION: 534-1291",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("STA.ROSA HOSPITAL: 508-0915",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("DSWD/ MSWD: 530-0015",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    
                  ]
                )
              )
            )
        )
       ),
     );
  }
}
