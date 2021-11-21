import 'package:flutter/material.dart';
import 'package:villboard/services/authservice.dart';

class Post {
  final String name;
  final String profile;
  final String title;
  final String image;

  Post({
    this.name,
    this.profile,
    this.title,
    this.image,
  });
}



// List<Post> postList = [
  
//   Post(
//     name: "Jamewell",
//     profile:
//         "https://villboard-main.s3.ap-southeast-1.amazonaws.com/01aa88d0-0d92-4c8f-92ee-aa3fe8c3f3f5.png",
//     title: "Villa Caceres Accepted Villboard Mobile and Web Application",
//     image:
//         "https://villboard-main.s3.ap-southeast-1.amazonaws.com/01aa88d0-0d92-4c8f-92ee-aa3fe8c3f3f5.png",
//   ),
// ];
