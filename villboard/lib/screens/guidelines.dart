import 'package:flutter/material.dart';

class guidelines extends StatefulWidget {
  guidelines({Key key}) : super(key: key);

  @override
  _guidelinesState createState() => _guidelinesState();
}

class _guidelinesState extends State<guidelines> {
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
          padding: EdgeInsets.all(25),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Image.asset('images/logo_vb.png', height: 100, width: 100,),
                    SizedBox(height: 10,),
                    Text("Villa Caceres",textAlign: TextAlign.justify,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),),
                    SizedBox(height: 20,),
                    Text("Guideline and Policies",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("1. Vehicles without VCEVHOA, Inc. sticker unless otherwise specified in The Revised Guidelines on the issuance and Use of Vehicle Sticker shall not be allowed to enter and pass through the village",textAlign: TextAlign.justify,style: TextStyle(fontSize: 14,  color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("2. As a general policy, ambulant vendors and peddlers of any merchandise shall notbe allowed to enter nor pass through the village unless with approval of the VCEVBoard of Directors ",textAlign: TextAlign.justify,style: TextStyle(fontSize: 14, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("3. Security officers shall strictly implement The Revised guidelines on the Issuanceand Use of VCEVHOA, Inc. Vehicle Stickers. ",textAlign: TextAlign.justify,style: TextStyle(fontSize: 14,  color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("4. All motorcycle riders should remove their helmet and all closed vans are subjectfor inspection upon the entry of both gates 1 and gate 2 to properly identify thevisitors coming in and out inside the village. ",textAlign: TextAlign.justify,style: TextStyle(fontSize: 14, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("5. Minors are not allowed / permitted to drive within the roads of the Villa Caceresunless accompanied / supervised by an adult. Minors caught driving a vehicle without any accompanying adult shall be brought back to their residence and their parents shall be served a written reprimand on the first offense. Succeeding offenses shall be subject to penalty charges amounting to P500.00 and P1,000.00 thereafter, which shall be carried over to form part of the monthly assessment / dues of the concerned homeowner.  ",textAlign: TextAlign.justify, style: TextStyle(fontSize: 14,  color: Colors.white),),
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
