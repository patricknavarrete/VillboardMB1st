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
  var loading = false;

  var name = TextEditingController();
  var suggest = TextEditingController();

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
                        height: 20.0,
                      ),
                      Container(
                        child: Form(
                          key: _form,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 10.0,
                                              offset: Offset(0, 5))
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
                                            controller: name,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              errorBorder: new OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              hintText: "Name",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400]),
                                            ),
                                            onChanged: (val) {
                                               aName = val;
                                            },
                                            validator: (String val) {
                                              if (val.isEmpty) {
                                                return "Name is required";
                                              }
                                              if (RegExp(r'[!@#<>?":_`~;{}$[\]/\\|=+)(*&^%0-9]')
                                                  .hasMatch(val)) {
                                                return "Please check your Name";
                                              }
                                              return null;
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
                                            controller: suggest,
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              errorBorder: new OutlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.red, width: 2.0),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              hintText: "Suggestions",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400]),
                                            ),
                                            onChanged: (val) {
                                              suggestions = val;
                                            },
                                            validator: (String val) {
                                              if (val.isEmpty) {
                                                return "Suggestions is required";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 25),
                                        loading == true ? CircularProgressIndicator(color: Colors.green,):
                                        Center(
                                            child: ButtonTheme(
                                              minWidth: 200,
                                              height: 50,
                                              child: RaisedButton(
                                                  child: Text('Submit', style: TextStyle(color: Colors.white),),
                                                  color: greenColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  elevation: 10.0,
                                                  onPressed: () {
                                                    setState(() {
                                                      loading = true;
                                                    });
                                                    if (_form.currentState
                                                        .validate()) {
                                                      AuthService()
                                                          .addSuggestion(
                                                          aName, suggestions)
                                                          .then((val) {
                                                            name.clear();
                                                            suggest.clear();
                                                            if(val.data['success']){
                                                              Fluttertoast.showToast(
                                                                  msg:
                                                                  val.data['msg'],
                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                  gravity: ToastGravity.BOTTOM,
                                                                  backgroundColor: Colors.green,
                                                                  textColor:Colors.white,
                                                                  fontSize: 16.0);
                                                              setState(() {
                                                                loading = false;
                                                              });
                                                            }
                                                            else{
                                                              Fluttertoast.showToast(
                                                                  msg:
                                                                  val.data['msg'],
                                                                  toastLength: Toast.LENGTH_SHORT,
                                                                  gravity: ToastGravity.BOTTOM,
                                                                  backgroundColor: Colors.red,
                                                                  textColor:Colors.white,
                                                                  fontSize: 16.0);
                                                              setState(() {
                                                                loading = false;
                                                              });
                                                            }
                                                      });
                                                    } else {
                                                      print("UnSuccessfull");
                                                      setState(() {
                                                        loading = false;
                                                      });
                                                    }
                                                  }),
                                            ),
                                          ),
                                        SizedBox(height: 25),
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