import 'package:flutter/material.dart';
import 'package:villboard/screens/homescreen.dart';
import 'package:villboard/services/color.dart';

class AddBlog extends StatefulWidget {
  AddBlog({Key key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  String valueChoose;
  List listItem = [
    "Announcement",
    "Sell/Rent House",
    "Budget Allocation",
    "Events",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenColorsLight,
          elevation: 0,
          title: Text('Add Post'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.of(context).pop(false);
              }),
        ),
        body: ListView(
          children: <Widget>[
            titleTextField(),
            bodyTextField(),
            SizedBox(height: 25),
            Container(
              height: 50,
              width: 20,
              padding: EdgeInsets.only(left: 45, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton(
                  value: valueChoose,
                  hint: Text("Select where do you want to Post"),
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
            SizedBox(
              height: 20,
            ),
            addButton(),
          ],
        ));
  }

  Widget titleTextField() {
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
          labelText: "Add Image and Title",
          prefixIcon: IconButton(
              icon: Icon(
                Icons.image,
                color: Colors.teal,
              ),
              onPressed: () {}),
        ),
        maxLength: 100,
        maxLines: null,
      ),
    );
  }

  Widget bodyTextField() {
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
          labelText: "Provide your caption",
        ),
        maxLines: null,
      ),
    );
  }

  Widget addButton() {
    return Center(
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal,
        ),
        child: Center(
            child: Text('Add Blog',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
