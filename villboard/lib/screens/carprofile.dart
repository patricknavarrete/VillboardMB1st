import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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


  Widget _carList(cFirstName, cLastName, cAddress, cPhoneNumber, vehicleModel, plateNumber){
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
    print(car);
    return Scaffold(
      body: car == null ?
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
          );
        }
    ),
    );
  }
}