import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:villboard/services/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:villboard/screens/login.dart';

import 'package:villboard/screens/announcement.dart' as announcement;
import 'package:villboard/screens/Sell.dart' as sell;
import 'package:villboard/screens/funding.dart' as funding;
import 'package:villboard/screens/events.dart' as events;

import 'package:villboard/screens/petregistration.dart';
import 'package:villboard/screens/carregistration.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/dataset.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String em = StorageUtil.getemail() ?? '';

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
              AuthService().logout(em).then((val) {
                Fluttertoast.showToast(
                    msg: val.data['msg'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
              SharedPreferences preference =
                  await SharedPreferences.getInstance();
              preference.clear();

              Navigator.pop(context);
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
  String lname = StorageUtil.getlastName() ?? '';
  String profilePic = StorageUtil.get_profilePic() ?? '';

  int currentState = 0;
  List<Widget> widgets = [
    // HomeScreen(),
    Profile(),
  ];
  List<String> titleString = ["Home Page", "Profile Page"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Container(
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [greenColor, greenColor]),
              ),
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      children: <Widget>[
                        profilePic != null && profilePic != ""
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 52.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green[100],
                                  radius: 50.0,
                                  backgroundImage: NetworkImage(profilePic),
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 52.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  radius: 50.0,
                                  child: Text(fname[0] + lname[0],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35)),
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('HI!' + ' ' + fname,
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text("Upload Monthly Maintence Payment",
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.payment_sharp,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => uploadtransaction()));
                    },
                  ),
                  ListTile(
                    title: Text("Suggestion Box",
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.redeem_sharp,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => suggestionbox()));
                    },
                  ),
                  ListTile(
                    title: Text("Amenities Reservation",
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.pending_actions_sharp,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => reservation()));
                    },
                  ),
                  ListTile(
                    title: Text("Pet Registration",
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.pets,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DogRegistration()));
                    },
                  ),
                  ListTile(
                    title: Text("Vehicle Registration",
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.car_repair,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarRegistration()));
                    },
                  ),
                  ListTile(
                    title: Text("Guidelines and policies",
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.policy_sharp,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => guidelines()));
                    },
                  ),
                  ListTile(
                    title: Text("Emergency Numbers",
                        style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => emergency()));
                    },
                  ),
                  ListTile(
                    title:
                        Text("About Us", style: TextStyle(color: Colors.white)),
                    trailing: Icon(
                      Icons.lightbulb,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => about()));
                    },
                  ),
                  ListTile(
                      title:
                          Text("Logout", style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.logout,
                        color: Colors.black,
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
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            titleString[currentState],
            style: TextStyle(color: Colors.black),
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
            labelColor: Colors.white,
            tabs: [
              Tab(
                  icon: Icon(Icons.campaign, color: Colors.black),
                  text: 'Announcements'),
              // Tab(
              //     icon: Icon(Icons.monetization_on, color:  Colors.black ),
              //     text: 'Sell/Rent House'),
              // Tab(
              //   icon: Icon(Icons.note, color:  Colors.black),
              //   text: 'Budget Allocation'),
              Tab(icon: Icon(Icons.event, color: Colors.black), text: 'Events')
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            new announcement.Announcement(),
            // new sell.Sell(),
            // new funding.Funding(),
            new events.Events(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => AddBlog()));
        //   },
        //   backgroundColor: Colors.green,
        //   child: Text(
        //     "+",
        //     style: TextStyle(fontSize: 35),
        //   ),
        // ),
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
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        currentState = 0;
                      });
                    },
                    iconSize: 35,
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    color: Colors.white,
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
