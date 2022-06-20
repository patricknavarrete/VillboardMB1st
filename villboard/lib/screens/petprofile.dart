import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:villboard/screens/homepage.dart';
import 'package:villboard/services/dataset.dart';

import '../services/authservice.dart';

var pFirstName, pLastName, pAddress, pPhoneNumber, petName,petBreed, pQR, pEmail;
bool loading = true;

class petprofile extends StatefulWidget {
  const petprofile({ Key key }) : super(key: key);

  @override
  _petprofileState createState() => _petprofileState();
}

class _petprofileState extends State<petprofile> {
  List<Pet> petList = [];

  String pn = StorageUtil.getphoneNumber() ?? '';
  String fname = StorageUtil.getfirstName() ?? '';
  String lname = StorageUtil.getlastName() ?? '';
  String ad = StorageUtil.getaddress() ?? '';

  var pets =  StorageUtil.getpetField();

  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)
    );
    print(path);
  }


  Future<String> downloadQR(String qr, String petName, String petBreed, String firstName, String lastName) async{

    final qrValidationResult = QrValidator.validate(
      data: qr,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    final qrCode = qrValidationResult.qrCode;

    final painter = QrPainter.withQr(
      qr: qrCode,
      color: const Color(0xFF000000),
      gapless: true,
      embeddedImageStyle: null,
      embeddedImage: null,
    );

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = "QR-Code-"+firstName+"-"+lastName+"-"+petName+"-"+petBreed;
    String path = '$tempPath/$ts.png';

    final picData = await painter.toImageData(2048, format: ui.ImageByteFormat.png);

    final buffer = picData.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(picData.offsetInBytes, picData.lengthInBytes)
    );


    print(path);
    return path;
  }

  Future<void> getPet() async {
    var userId = await StorageUtil.get_id();
    print(userId);
    AuthService().postPet(pFirstName, pLastName, pAddress, pPhoneNumber, petName,petBreed, userId, pQR).then((val) {
      petList.clear();
      for (var i = 0; i < val.data.length; i++) {
        var temp = val.data[i];
        if(temp['userId'] == userId){
          setState(() {
            petList.add(new Pet(
              pFirstName: temp['pFirstName'],
              pLastName: temp['pLastName'],
              pAddress: temp['pAddress'],
              pPhoneNumber: temp['pPhoneNumber'],
              petName: temp['petName'],
              petBreed: temp['petBreed'],
              pQR: temp['pQR'],
             // pEmail:  temp['pEmail'],
              createdAt:  temp['createdAt'],
            ));
          });
          print(temp);
        }
      }
      petList.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
      setState(() {
        loading = false;
      });
    });
  }

  Widget _petList(pFirstName, pLastName, pAddress, pPhoneNumber, petName,petBreed, qr){
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(Icons.pets,color: Colors.green[200], size: 80,),
                ),
                SizedBox(height: 5),
                Text(
                  petName,
                  style: GoogleFonts.ptSans(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Pet Owner Name:',
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
     /*       SizedBox(
              height: 10,
            ),
            Text(
              'Email Address:',
              style: GoogleFonts.ptSans(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 5),
            Text(
              pEmail == null? "" : pEmail,
              style: GoogleFonts.ptSans(
                fontSize: 19,
              ),
            ),*/
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
            SizedBox(height: 15),

            qr == null ? Container() :
            SizedBox(
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("QR Code"),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  showDialogFunc(
                      context,
                      qr,
                      petName,
                      petBreed,
                      pFirstName,
                      pLastName);
                },
              ),
            ),
          ],
        ),
      );
  }

  @override
  void initState() {
    super.initState();
    getPet();
  }

  @override
  Widget build(BuildContext context) {
    print(petList.length);
    return Scaffold(
      body: loading == true ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white, color: Colors.green),) :
      petList.length == 0 ?
      Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.pets,color: Colors.blueGrey[100], size: 150,),
              Text('No Pet Record', style: TextStyle(color: Colors.blueGrey[300], fontSize: 15),),
            ],
          ),
        ),
      )
      : ListView.separated(
          itemCount: petList.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[400], thickness: 1.5,
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
              petList[index].pQR,
           //   petList[index].pEmail,
            );
          }
      ),
    );
  }

  showDialogFunc(context, data, petName, petBreed, pFirstName, pLastName) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: QrImage(
                        data: data,
                        version: QrVersions.auto,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async{
                      String path = await downloadQR(data, petName, petBreed, pFirstName, pLastName);
                      final success = await GallerySaver.saveImage(path);
                      if(success == true){
                        Fluttertoast.showToast(
                            msg: "QR Code saved to Gallery",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "QR Code failed to save",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Container(
                      child: Text('Download QR Code',
                          style: GoogleFonts.ptSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

