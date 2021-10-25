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

List<Post> postList = [];