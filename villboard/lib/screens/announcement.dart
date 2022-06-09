import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:villboard/services/dataset.dart';
import 'package:villboard/services/authservice.dart';
import 'package:villboard/screens/homepage.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:villboard/services/color.dart';

List<Post> postList = [];
var postField, postCaption, postCategory, photoUrl;

class Announcement extends StatefulWidget {

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  Future<void> temp() async {
    AuthService()
        .postAnnouncement(
      postField,
      postCaption,
      postCategory,
      photoUrl,
    ).then((val) {
      postList.clear();
      for (var i = 0; i < val.data.length; i++) {
        //if
        setState(() {
          var temp = val.data[i];
          if (val.data[i]['postCategory'] != "Events") {
            setState(() {
              postList.add(new Post(
                name: temp['postField'][0]['firstName'],
                profile: temp['photoUrl'],
                // temp['postField'][0]['photoUrlProfile'],
                title: temp['postCaption'],
                image: temp['photoUrl'],
              ));
            });
          }
          print(val.data);
          print(val.data.length);
          print(postList);
        });
      }
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
      body: LiquidPullToRefresh(
        onRefresh: temp,
        showChildOpacityTransition: false,
          color: greenColor,
        child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: PostWidget(),
            )
          ],
        ),
    )));
  }
}

class PostWidget extends StatefulWidget {
  @override
  State<PostWidget> createState() => _PostWidgetState();
}
class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: postList.length,
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
                      Container(
                        width: 48,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(postList[index].profile),
                          radius: 26,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postList[index].name,
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
                postList[index].title,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(postList[index].image),
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
