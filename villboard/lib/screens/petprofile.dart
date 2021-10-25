import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/sharedpref.dart';


class petprofile extends StatefulWidget {
  const petprofile({ Key key }) : super(key: key);


  @override
  _petprofileState createState() => _petprofileState();
}

class _petprofileState extends State<petprofile> {

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
                child: ClipOval(child: Image.asset('images/petpic.jpg'))),
          ),
          SizedBox(height: 25),
          Text(
            'Pet Owners Name:',
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
            'Pet Name',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Bantay',
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Pet Breed:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Golden Retriever',
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
                child: ClipOval(child: Image.asset('images/petpic2.jpg'))),
          ),
          SizedBox(height: 25),
          Text(
            'Pet Owners Name:',
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
            'Pet Name',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'MeowMeow',
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Pet Breed:',
            style: GoogleFonts.ptSans(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Golden Retriever',
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