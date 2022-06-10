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

var cFirstName, cLastName, cAddress, cPhoneNumber, vehicleModel, plateNumber, cQR;
List<Car> carList = [];

class carprofile extends StatefulWidget {
  const carprofile({ Key key }) : super(key: key);

  @override
  _carprofileState createState() => _carprofileState();
}

class _carprofileState extends State<carprofile> {

  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes)
    );
    print(path);
  }


  Future<String> downloadQR(String qr) async{

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
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    String path = '$tempPath/$ts.png';

    final picData = await painter.toImageData(2048, format: ui.ImageByteFormat.png);

    final buffer = picData.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(picData.offsetInBytes, picData.lengthInBytes)
    );


    print(path);
    return path;
  }

  String pn = StorageUtil.getphoneNumber() ?? '';
  String fname = StorageUtil.getfirstName() ?? '';
  String lname = StorageUtil.getlastName() ?? '';
  String ad = StorageUtil.getaddress() ?? '';

  var car =  StorageUtil.getcarField();

  Future<void> getCar() async {
    var userId = await StorageUtil.get_id();
    print(userId);
    AuthService().postCar(cFirstName, cLastName, cAddress, cPhoneNumber, vehicleModel, plateNumber, userId, cQR).then((val) {
      carList.clear();
      for (var i = 0; i < val.data.length; i++) {
        var temp = val.data[i];
        if(temp['userId'] == userId){
          setState(() {
            carList.add(new Car(
              cFirstName: temp['cFirstName'],
              cLastName: temp['cLastName'],
              cAddress: temp['cAddress'],
              cPhoneNumber: temp['cPhoneNumber'],
              vehicleModel: temp['vehicleModel'],
              plateNumber: temp['plateNumber'],
              cQR: temp['cQR'],
            ));
          });
        }
        print(val.data);
        print(val.data.length);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCar();
  }


  Widget _carList(cFirstName, cLastName, cAddress, cPhoneNumber, vehicleModel, plateNumber, qr){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/carcar.jpg'),
              radius: 50.0,
            ),
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
            cFirstName +" " + cLastName,
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
            cPhoneNumber,
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
            cAddress,
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
            vehicleModel,
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
            plateNumber,
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("QR Code"),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                showDialogFunc(
                    context,
                    qr);
              },
            ),
          ),

        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    print(carList.length);
    return Scaffold(
      body: carList.length == 0 ?
      Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.car_repair,color: Colors.blueGrey[100], size: 150,),
              Text('No Car Record', style: TextStyle(color: Colors.blueGrey[300], fontSize: 15),),
            ],
          ),
        ),
      )
          : ListView.separated(
        itemCount: carList.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (BuildContext context,
            int index) {
          return _carList(
            carList[index].cFirstName,
            carList[index].cLastName,
            carList[index].cAddress,
            carList[index].cPhoneNumber,
            carList[index].vehicleModel,
            carList[index].plateNumber,
            carList[index].cQR,
          );
        }
    ),
    );
  }

  showDialogFunc(context, data) {
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
                      String path = await downloadQR(data);
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