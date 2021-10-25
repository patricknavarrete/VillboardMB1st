import 'package:flutter/material.dart';

class uploadtransaction extends StatefulWidget {
  uploadtransaction({Key key}) : super(key: key);

  @override
  _uploadtransactionState createState() => _uploadtransactionState();
}

class _uploadtransactionState extends State<uploadtransaction> {

    TextEditingController controller;

  submitTransaction(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Successfully Uploaded Monthly Maintenance Transaction'),
            content: Text('You would reveice an email confirmation for your Reference Number'),

            actions: <Widget>[
              MaterialButton(
                elevation: 0,
                child: Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }

  String valueChoose;
  List listItem = ["Bank", "Gcash"];
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/logo_vb.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Upload Monthly Maintenance",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Home owner and payment information",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.green,
                        ),
                        labelText: "First Name",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.green,
                        ),
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.green,
                        ),
                        labelText: "Address",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email,
                          size: 30,
                          color: Colors.green,
                        ),
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.green,
                        ),
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.receipt,
                          size: 30,
                          color: Colors.green,
                        ),
                        labelText: "Reference Number",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  _dateTime == null
                      ? 'Nothing has been picked yet'
                      : _dateTime.toString(),
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: _dateTime == null
                                  ? DateTime.now()
                                  : _dateTime,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2025))
                          .then((date) {
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Date"),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 55,
                  width: 280,
                  padding: EdgeInsets.only(left: 45, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdownButton(
                      value: valueChoose,
                      hint: Text("Type of Transaction"),
                      icon: Icon(Icons.arrow_drop_down),
                      dropdownColor: Colors.green,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      submitTransaction(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
