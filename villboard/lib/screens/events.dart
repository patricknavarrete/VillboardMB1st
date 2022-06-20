import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:villboard/services/dataset.dart';
import 'package:villboard/services/authservice.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:villboard/services/color.dart';

List<Post> postListE = [];
var postField, postCaption, postCategory, photoUrl;
bool loading = true;
class Events extends StatefulWidget {
  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

  Future<void> temp() async {
    AuthService()
        .postAnnouncement(
      postField,
      postCaption,
      postCategory,
      photoUrl,
    ).then((val) {
      postListE.clear();
      for (var i = 0; i < val.data.length; i++) {
        //if
        setState(() {
          var temp = val.data[i];
          if (val.data[i]['postCategory'] == "Events") {
            setState(() {
              postListE.add(new Post(
                name: temp['postField'][0]['firstName'],
                profile: temp['postField'][0]['photoUrlProfile'],
                // profile: temp['postField'][0]['profilePicture'],
                // temp['postField'][0]['photoUrlProfile'],
                title: temp['postCaption'],
                image: temp['photoUrl'],
                createdAt: temp['createdAt'],
              ));
            });
          }
          print(val.data);
          print(val.data.length);
          print(postListE);
        });
      }
      postListE.sort((a, b) {
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
    temp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: loading == true ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white, color: Colors.green),) :
      postListE.length == 0 ?
      Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.event,color: Colors.blueGrey[100], size: 150,),
              Text('No Events', style: TextStyle(color: Colors.white, fontSize: 15),),
            ],
          ),
        ),
      )
          :
      LiquidPullToRefresh(
        onRefresh: temp,
        showChildOpacityTransition: false,
        color: greenColor,
        child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20,),
            Text("Pull down to Refresh List", style: TextStyle(color: Colors.white),),
            Flexible(
              child: PostWidget(),
            )
          ],
        ),
      ),
      ));
  }
}

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: postListE.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      postListE[index].profile != null && postListE[index].profile != ""?
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 27.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 26.0,
                          backgroundImage: NetworkImage(postListE[index].profile),
                        ),
                      ):
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 27.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 26.0,
                          child: Text(postListE[index].name[0],
                              style: TextStyle(color: Colors.white, fontSize: 35)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postListE[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                postListE[index].title,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              postListE[index].image == null ? Container() :
              Center(
                child: Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(postListE[index].image),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
