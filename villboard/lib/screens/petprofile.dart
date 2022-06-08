import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:villboard/screens/homepage.dart';

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

  Widget _petList(pFirstName, pLastName, pAddress, pPhoneNumber, petName,petBreed){
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                  backgroundImage: AssetImage('images/petpic.jpg'),
                  radius: 50.0,
              ),
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
              pFirstName + " " + pLastName,
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
              pPhoneNumber,
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
              pAddress,
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
              petName,
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
              petBreed,
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
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: petList.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemBuilder: (BuildContext context,
              int index) {
            return _petList(
              petList[index].pFirstName,
              petList[index].pLastName,
              petList[index].pAddress,
              petList[index].pPhoneNumber,
              petList[index].petName,
              petList[index].petBreed,
            );
          }
      ),
    );
      

  }
}