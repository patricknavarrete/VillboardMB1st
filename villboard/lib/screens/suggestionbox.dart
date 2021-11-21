import 'package:flutter/material.dart';
import 'package:villboard/services/FadeAnimation.dart';
import 'package:villboard/services/color.dart';
import 'package:villboard/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';

class suggestionbox extends StatefulWidget {
  const suggestionbox({Key key}) : super(key: key);

  @override
  _suggestionboxState createState() => _suggestionboxState();
}

class _suggestionboxState extends State<suggestionbox> {
  bool isChecked = false;

  var aName, suggestions;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.green,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Suggest/Report to admin anounymously",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        child: Form(
                          key: _form,
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  143, 148, 251, .2),
                                              blurRadius: 20.0,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]),
                                            ),
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Name",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400]),
                                            ),
                                            onChanged: (val) {
                                               aName = val;
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]),
                                            ),
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Suggestions",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400]),
                                            ),
                                            onChanged: (val) {
                                              suggestions = val;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 25),
                                        Center(
                                            child: ButtonTheme(
                                              minWidth: 200,
                                              height: 50,
                                              child: RaisedButton(
                                                  child: Text('Submit'),
                                                  color: greenColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  elevation: 10.0,
                                                  onPressed: () {
                                                    if (_form.currentState
                                                        .validate()) {
                                                      AuthService()
                                                          .addSuggestion(
                                                          aName, suggestions)
                                                          .then((val) {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                            val.data['msg'],
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                            ToastGravity
                                                                .BOTTOM,
                                                            backgroundColor:
                                                            Colors.green,
                                                            textColor:
                                                            Colors.white,
                                                            fontSize: 16.0);
                                                      });
                                                    } else {
                                                      print("UnSuccessfull");
                                                    }
                                                  }),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ), 
          ],
        ),
      ),
    );
  }
}