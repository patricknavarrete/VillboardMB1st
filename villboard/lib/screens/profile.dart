import 'package:flutter/material.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/screens/changepassword.dart' as changepassword;
import 'package:villboard/screens/petprofile.dart' as petprofile;
import 'package:villboard/screens/carprofile.dart' as carprofile;
import 'package:villboard/screens/mainprofile.dart' as mainprofile;


class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  var firstName;



  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
          child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Profile Page', style: TextStyle(color: Colors.black)),
            elevation: 0,
            backgroundColor: greenColor,
            bottom: TabBar(
            controller: controller,
            isScrollable: true,
            indicatorColor: Colors.green,
            indicatorWeight: 5,
            labelStyle: TextStyle(),
            labelColor: Colors.white,
            tabs: [
            Tab(icon: Icon(Icons.person, color: Colors.black), text: 'Main Profile'),
            Tab(icon: Icon(Icons.pets,color: Colors.black ), text: 'Pet Profile'),
            Tab(icon: Icon(Icons. car_repair,color: Colors.black), text:'Car Profile', ),
            Tab(icon: Icon(Icons.lock, color: Colors.black), text: 'ChangePassword'),
          ],
          ),
          ),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              new mainprofile.mainprofile(),
              new petprofile.petprofile(), 
              new carprofile.carprofile(),
              new changepassword.changepassword(),
            ],
          )
        ),
    );
    
  }


}
