import 'package:flutter/material.dart';

class Post {
  final String name;
  final String profile;
  final String title;
  final String image;


  Post(
      {
      this.name,
      this.profile,
      this.title,
      this.image,

      });
}

List<Post> postList = [
    Post(
      name: "Nitzel",
      profile: "https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/191768017_6404925812866998_4825516477488368280_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHwaEnt384bdqd1DXTqTw1wMSc2pSheWmYxJzalKF5aZn4vAVNL9rPm8TP8YZVAaM1Cycd7WYBmA5jOZWUyXaD2&_nc_ohc=Vb4oLPDNMu0AX__6PH8&tn=pcxqeWzxDFjP9lD4&_nc_ht=scontent.fmnl4-6.fna&oh=a78ba12d0e09662cb7b5a1a9b51713d8&oe=60CD8670",
      title: "Budget Allocation",
      image: "http://lorempixel.com/400/250/nature",)
];