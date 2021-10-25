import 'package:flutter/material.dart';
import 'package:villboard/screens/homescreen.dart';
import 'package:villboard/services/color.dart';

class ChatAdmin extends StatefulWidget {
  ChatAdmin({Key key}) : super(key: key);

  @override
  _ChatAdminState createState() => _ChatAdminState();
}

class _ChatAdminState extends State<ChatAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenColorsLight,
          elevation: 0,
          title: Text('Chat Admin'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.clear), onPressed: () {
              Navigator.of(context).pop(false);
          }),
        ),
        body: ListView(
          children: <Widget>[
            image(),
            SizedBox(height:300,),
            bodyTextField(),
            addButton(),
          ],
        ));
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
     child:  CircleAvatar(
                radius: 60,
                child: ClipOval(child: Image.asset('images/Profile.png'))),

    );
  }
  Widget bodyTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            ),
          ),
          labelText: "Put your message here",
      
        ),
        maxLines:null,
      ),
    );
  }
  Widget addButton(){
    return Center(
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal,
        ),
        child: Center(child: Text('Send',style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
      ),
      
    );
  }
}
