import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:villboard/services/dataset.dart';



class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: PostWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
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
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(20),
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