import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/screens/AddFamily.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/dataset.dart';
import 'package:villboard/services/sharedpref.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

var aFirstName, aLastName, aAddress, aEmail, aPhoneNumber, member, userId;
List<Member> memberList = [];
bool loading = true;

class mainprofile extends StatefulWidget {
  const mainprofile({Key key}) : super(key: key);

  @override
  _mainprofileState createState() => _mainprofileState();
}

class _mainprofileState extends State<mainprofile> {
  var newfirstname, newlastname, newmiddleinitial, newaddress, newphonenumber;

  Future<void> getMember() async {
    var userId = await StorageUtil.get_id();
    AuthService().postFamily(aFirstName, aLastName, aAddress, aPhoneNumber, member, userId).then((val) {
      memberList.clear();
      for (var i = 0; i < val.data.length; i++) {
        var temp = val.data[i];
        if(temp['userId'] == userId){
          setState(() {
            memberList.add(new Member(
              aFirstName: temp['aFirstName'],
              aLastName: temp['aLastName'],
              aAddress: temp['aAddress'],
              aPhoneNumber: temp['aPhoneNumber'],
         //     aEmail: temp['aEmail'],
              member: temp['Member'],
              userID: temp['userId'],
              createdAt:  temp['createdAt'],
            ));
          });
        }
        print(val.data);
        print(val.data.length);
      }
      memberList.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMember();
  }

  TextEditingController controller;

  editFirstName(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your First Name'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: fname,
                ),
                onChanged: (val) {
                  newfirstname = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                      .hasMatch(newfirstname)) {
                      Fluttertoast.showToast(
                          msg: "Please check your First Name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                  }
                  else{
                    AuthService().changeFirstname(em, newfirstname).then((val) {
                      setState(() {
                        StorageUtil.setfirstName(newfirstname);
                        fname = newfirstname;
                        Navigator.of(context).pop();
                      });
                      Fluttertoast.showToast(
                          msg: "First Name successfully change",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }
                },
              )
            ],
          );
        });
  }

    editLastName(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Last Name'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: lname,
                ),
                onChanged: (val) {
                  newlastname = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                      .hasMatch(newlastname)) {
                    Fluttertoast.showToast(
                        msg: "Please check your Last Name",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else{
                    AuthService().changeLastname(em, newlastname).then((val) {
                      setState(() {
                        StorageUtil.setlastName(newlastname);
                        lname = newlastname;
                        Navigator.of(context).pop();
                      });
                      Fluttertoast.showToast(
                          msg: "Last Name successfully change",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }
                },
              )
            ],
          );
        });
  }

  editMiddleinitial(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Middle Initial'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: mname,
                ),
                onChanged: (val) {
                  newmiddleinitial = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  if (newmiddleinitial == null) {
                    Fluttertoast.showToast(
                        msg: "Middle Initial is Required",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                      .hasMatch(newmiddleinitial)) {
                    Fluttertoast.showToast(
                        msg: "Please check your Middle Initial",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else{
                    AuthService().changeMiddleinitial(em, newmiddleinitial).then((val) {
                      setState(() {
                        StorageUtil.setmiddleInitial(newmiddleinitial);
                        mname = newmiddleinitial;
                        Navigator.of(context).pop();
                      });
                      Fluttertoast.showToast(
                          msg: "Middle Initial successfully change",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }
                },
              )
            ],
          );
        });
  }

    editAddress(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Address'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ad,
                ),
                onChanged: (val) {
                  newaddress = val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  if (newaddress == null) {
                    Fluttertoast.showToast(
                        msg: "Address is Required",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else if (!RegExp(r'^([\w,:\s/.-]*)$').hasMatch(newaddress)) {
                    Fluttertoast.showToast(
                        msg: "Please check your Address",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else{
                    AuthService().changeAddress(em, newaddress).then((val) {
                      setState(() {
                        StorageUtil.setaddress(newaddress);
                        ad = newaddress;
                        Navigator.of(context).pop();
                      });
                      Fluttertoast.showToast(
                          msg: "Address successfully change",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }
                },
              )
            ],
          );
        });
  }

  editPhonenumber(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit your Phone Number'),
            content: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: pn,
                  prefixText: "+63"
                ),
                onChanged: (val) {
                  newphonenumber =  val;
                }),
            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Submit'),
                onPressed: () {
                  if (newphonenumber == null) {
                    Fluttertoast.showToast(
                        msg: "Phone Number is Required",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else if (!RegExp(r'^[0-9]{10}$').hasMatch(newphonenumber)) {
                    Fluttertoast.showToast(
                        msg: "Please check your Phone Number",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  else{
                    AuthService().changePhonenumber(em, "+63" +newphonenumber).then((val) {
                      setState(() {
                        StorageUtil.setphoneNumber("+63" + newphonenumber);
                        pn = "+63" + newphonenumber;
                        Navigator.of(context).pop();
                      });
                      Fluttertoast.showToast(
                          msg: "Phone Number successfully change",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }
                },
              )
            ],
          );
        });
  }

  String lname = StorageUtil.getlastName() ?? '';
  String mname = StorageUtil.getmiddleInitial() ?? '';
  String ad = StorageUtil.getaddress() ?? '';
  String pn = StorageUtil.getphoneNumber() ?? '';
  String fname = StorageUtil.getfirstName() ?? '';
  String em = StorageUtil.getemail() ?? '';
  String profilePic = StorageUtil.get_profilePic() ?? '';

  Widget _memberList(aFirstName, aLastName, aAddress, aPhoneNumber, member){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(Icons.person,color:  Colors.green[200], size: 80,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    aFirstName,
                    style: GoogleFonts.ptSans(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    aLastName,
                    style: GoogleFonts.ptSans(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                'Member:',
                style: GoogleFonts.ptSans(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            member,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                'Address:',
                style: GoogleFonts.ptSans(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            aAddress,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
     /*     SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                'Email Address:',
                style: GoogleFonts.ptSans(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            aEmail,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),*/
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                'Phone Number:',
                style: GoogleFonts.ptSans(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            aPhoneNumber,
            style: GoogleFonts.ptSans(
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  loading == true ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white, color: Colors.green),) :
      DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: TabBar(
                indicatorColor: Colors.green,
                tabs: [
                  Tab(
                    text: "My Profile",
                  ),
                  Tab(
                    text: "Other Members",
                  ),
                ],
                labelColor: Colors.black,
                indicator: MaterialIndicator(
                  color: Colors.green,
                  height: 5,
                  topLeftRadius: 8,
                  topRightRadius: 8,
                  horizontalPadding: 10,
                  tabPosition: TabPosition.bottom,
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 3.0),
                  child:   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: profilePic != null && profilePic != "" ?
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 52.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.green[100],
                              radius: 50.0,
                              backgroundImage: NetworkImage(profilePic),
                            ),
                          ):
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 52.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 50.0,
                              child: Text(fname[0] +  lname[0],
                                  style: TextStyle(color: Colors.white, fontSize: 35)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'First Name:',
                              style: GoogleFonts.ptSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit, color: Colors.orange),
                                onPressed: () {
                                  editFirstName(context);
                                })
                          ],
                        ),
                        Text(
                          fname,
                          style: GoogleFonts.ptSans(
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Last Name:',
                              style: GoogleFonts.ptSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit, color: Colors.orange),
                                onPressed: () {
                                  editLastName(context);
                                })
                          ],
                        ),
                        Text(
                          lname,
                          style: GoogleFonts.ptSans(
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Middle Initial:',
                              style: GoogleFonts.ptSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit, color: Colors.orange),
                                onPressed: () {
                                  editMiddleinitial(context);
                                })
                          ],
                        ),
                        Text(
                          mname,
                          style: GoogleFonts.ptSans(
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Address:',
                              style: GoogleFonts.ptSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            (SizedBox(width: 10)),
                            IconButton(
                                icon: Icon(Icons.edit, color: Colors.orange),
                                onPressed: () {
                                  editAddress(context);
                                })
                          ],
                        ),
                        Text(
                          ad,
                          style: GoogleFonts.ptSans(
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Phone Number:',
                              style: GoogleFonts.ptSans(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit, color: Colors.orange),
                                onPressed: () {
                                  editPhonenumber(context);
                                })
                          ],
                        ),
                        Text(
                          pn,
                          style: GoogleFonts.ptSans(
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(height: 25,),
                      ],
                    ),
                  ),
                ),
              ),
              memberList.length == 0 ?
              Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person,color: Colors.blueGrey[100], size: 150,),
                      Text('No Record', style: TextStyle(color: Colors.blueGrey[300], fontSize: 15),),
                      SizedBox(height: 20,),
                      ButtonTheme(
                        minWidth: 250,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => AddFamily()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text("Add a member of the house"),
                        ),
                      ),
                    ],
                  ),
                ),
              ):
              Column(
                children: [
                SizedBox(height: 20,),
                Center(
                  child: ButtonTheme(
                    minWidth:MediaQuery.of(context).size.width-65,
                    height: 45,
                    child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddFamily()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Add a member of the house"),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text("Pull down to Refresh List"),
                      Expanded(
                        child: LiquidPullToRefresh(
                            onRefresh: getMember,
                            showChildOpacityTransition: false,
                            color: Colors.white,
                            backgroundColor: Colors.green,
                            child: ListView.separated(
                                itemCount: memberList.length,
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.grey,
                                ),
                                itemBuilder: (BuildContext context,
                                    int index) {
                                  return _memberList(
                                    memberList[index].aFirstName,
                                    memberList[index].aLastName,
                                    memberList[index].aAddress,
                                 //   memberList[index].aEmail,
                                    memberList[index].aPhoneNumber,
                                    memberList[index].member,
                                  );
                                }
                            ),),
                      ),
                    ],
                  ),
                )]),
            ],
          ),
        ),
      ),

    );
  }
}
