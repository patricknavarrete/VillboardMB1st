import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/sharedpref.dart';


class carprofile extends StatefulWidget {
  const carprofile({ Key key }) : super(key: key);

  @override
  _carprofileState createState() => _carprofileState();
}

class _carprofileState extends State<carprofile> {

    String pn = StorageUtil.getphoneNumber() ?? '';
  String fname = StorageUtil.getfirstName() ?? '';
  String lname = StorageUtil.getlastName() ?? '';
  String ad = StorageUtil.getaddress() ?? '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
          Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
                radius: 60,
                child: ClipOval(child: Image.asset('images/carcar.jpg'))),
          ),
          SizedBox(height: 25),
          Text(
            'Car Owners Name:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            fname +" " + lname,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
           'Contact Number:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            pn,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Address:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            ad,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Car Model',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'ONER',
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Plate Number',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'UV 123456',
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
           SizedBox(height: 5),
          Text(
            'QR Code:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          Container(
            child: new Image.asset('images/QR.png',height: 80, fit: BoxFit.cover),
          ),
          Divider(
              color: Colors.black),
              Center(
            child: CircleAvatar(
                radius: 60,
                child: ClipOval(child: Image.asset('images/carpic2.jpg'))),
          ),
          SizedBox(height: 25),
          Text(
            'Car Owners Name:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            fname +" " + lname,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
           'Contact Number:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            pn,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Address:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            ad,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Car Model',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Tesla',
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Plate Number',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'XYZ 123456',
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
           SizedBox(height: 5),
          Text(
            'QR Code:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          Container(
            child: new Image.asset('images/QR.png',height: 80, fit: BoxFit.cover),
          ),
        ],
      ),
       )
      ],
      ),
      
    );
  }
}