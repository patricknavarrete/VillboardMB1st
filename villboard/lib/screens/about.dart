import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatefulWidget {
  about({Key key}) : super(key: key);

  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
     return Container(
       decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg.jpg"), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken))),
       child: Scaffold(
         backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('About Us'),
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.lightGreenAccent,
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
                    SizedBox(height: 20,),
                    Image.asset('images/logo_vb.png', height: 50, width: 50,),
                    SizedBox(height: 10,),
                    Text("About Us",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("Villa Caceres",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 20,),
                    Text("Villa Caceres is a residential community developed by Moldex Realty Inc. in Brgy. Dila in Sta. Rosa, Laguna. This house and lot community is therefore located at the heart of Laguna. This housing development is built in partnership by Armed Forces of the Philippines Retirement Separation Benefits System with that of Moldex Realty Inc. This partnership community takes inspiration from Spain in order to transform you to a Spanish Mediterranean feel with its beautifully designed homes. The entire development spans a total land area of 53 hectares. It is the perfect nesting place for those who want to experience an idyllic lifestyle.",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                    
                  ]
                )
              )
            )
        )
       ),
     );
  }
}
