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
      name: "Jasper",
      profile: "http://lorempixel.com/200/200/people/2",
      title: "Selling House",
      image: "http://lorempixel.com/400/250/sports/9",),
  Post(
      name: "Vincent",
      profile: "https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/84108398_1539389349547647_2826917091628548096_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeF97MNnZKU17FCY55hNqB4KBSh9Lg7eK_sFKH0uDt4r-5aiD1a6Poic4ll0y_2yM2Q3XlEdDsbqfLvpcSiNyuBZ&_nc_ohc=4RExyswrHz8AX8LFEY8&_nc_ht=scontent.fmnl4-6.fna&oh=9081309e29a1543f5bf233f31af019bd&oe=60CBF47B",
      title: "Love Animals",
      image: "http://lorempixel.com/400/250/animals/9",),
];