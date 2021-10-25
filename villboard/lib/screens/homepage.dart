import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:villboard/screens/about.dart';
import 'package:villboard/screens/blogpage.dart';
import 'package:villboard/screens/chatadmin.dart';
import 'package:villboard/screens/emergencynumber.dart';
import 'package:villboard/screens/guidelines.dart';
import 'package:villboard/screens/homescreen.dart';
import 'package:villboard/screens/profile.dart';
import 'package:villboard/screens/reservation.dart';
import 'package:villboard/screens/suggestionbox.dart';
import 'package:villboard/screens/uploadtransaction.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:villboard/screens/login.dart';

import 'package:villboard/screens/announcement.dart' as announcement;
import 'package:villboard/screens/Sell.dart' as sell;
import 'package:villboard/screens/funding.dart' as funding;
import 'package:villboard/screens/events.dart' as events;

import 'package:villboard/screens/petregistration.dart';
import 'package:villboard/screens/carregistration.dart';


class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {

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

  Future<bool> logoutDialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to Logout from the application?'),
        actions: [
          FlatButton(
            child: Text('Logout'),
            onPressed: () async {
              SharedPreferences preference =
                  await SharedPreferences.getInstance();
              preference?.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => loginscreen()));
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    );
  }

  String fname = StorageUtil.getfirstName() ?? '';

  int currentState = 0;
  List<Widget> widgets = [
    HomeScreen(),
    Profile(),
  ];
  List<String> titleString = ["Home Page", "Profile Page"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Container(
          child: Drawer(
            child: Container(
            decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [greenColor, greenColorsLight 
              ]
               ),
             ) ,
               
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/Profile.png'),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Hi!' + ' ' + fname)
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text("Upload Monthly Maintence Payment"),
                    trailing: Icon(Icons.payment_sharp),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => uploadtransaction()));
                    },
                  ),
                  ListTile(
                    title: Text("Suggestion Box"),
                    trailing: Icon(Icons.redeem_sharp),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => suggestionbox()));
                    },
                  ),
                  ListTile(
                    title: Text("Chat Admin"),
                    trailing: Icon(Icons.chat_sharp),
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatAdmin()));
                    },
                  ),
                  ListTile(
                    title: Text("Amenities Reservation"),
                    trailing: Icon(
                      Icons.pending_actions_sharp,
                    ),
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => reservation()));
                    },
                  ),
                  ListTile(
                    title: Text("Pet Registration"),
                    trailing: Icon(
                      Icons.qr_code,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DogRegistration()));
                    },
                  ),
                  ListTile(
                    title: Text("Car Registration"),
                    trailing: Icon(
                      Icons.qr_code,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarRegistration()));
                    },
                  ),
                  ListTile(
                    title: Text("Guidelines and policies"),
                    trailing: Icon(
                      Icons.policy_sharp,
                    ),
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => guidelines()));
                    },
                  ),
                  ListTile(
                    title: Text("Emergency Numbers"),
                    trailing: Icon(
                      Icons.phone,
                    ),
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => emergency()));
                    },
                  ),
                  ListTile(
                    title: Text("About Us"),
                    trailing: Icon(
                      Icons.lightbulb,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => about()));
                    },
                  ),
                  ListTile(
                      title: Text("Logout"),
                      trailing: Icon(
                        Icons.logout,
                      ),
                      onTap: () async {
                        logoutDialog();
                      }),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: greenColor,
          iconTheme: IconThemeData(color: jeanOrange),
          title: Text(
            titleString[currentState],
            style: TextStyle(color: jeanOrange),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: 40,
                child: Image.asset('images/logo_vb.png'),
              ),
              
            ),
            
          ],
          bottom: TabBar(
            controller: controller,
            isScrollable: true,
            indicatorColor: Colors.green,
            indicatorWeight: 5,
            labelStyle: TextStyle(),
            labelColor: Colors.black,
            tabs: [
              Tab(
                  icon: Icon(Icons.campaign, color: jeanOrange),
                  text: 'Announcements'),
              Tab(
                  icon: Icon(Icons.monetization_on, color: jeanOrange),
                  text: 'Sell/Rent House'),
              Tab(
                icon: Icon(Icons.note, color: jeanOrange),
                text: 'Budget Allocation',
              ),
              Tab(icon: Icon(Icons.event, color: jeanOrange), text: 'Events')
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            new announcement.Announcement(),
            new sell.Sell(),
            new funding.Funding(),
            new events.Events(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
                            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddBlog()));
          },
          backgroundColor: Colors.greenAccent,
          child: Text(
            "+",
            style: TextStyle(fontSize: 35),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: greenColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 12.0,
          child: Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    color:
                         jeanOrange,
                    onPressed: () {
                      setState(() {
                        currentState = 0;
                      });
                    },
                    iconSize: 35,
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    color:
                        currentState == 1 ? Colors.orangeAccent : jeanOrange,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    iconSize: 35,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
