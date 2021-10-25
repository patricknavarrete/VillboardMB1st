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
      name: "Arvin",
      profile: "https://scontent.fmnl4-4.fna.fbcdn.net/v/t1.6435-9/30709330_1808253762623759_7365552317715709952_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeEal754lrBByyObVleSsslp2SUrbgS3XwzZJStuBLdfDGPdiSpr9o5Loe-skJm2yZgjm3_KxVWsBLdhqsonzfeS&_nc_ohc=RYFy3-WBaAwAX9CZIEi&_nc_ht=scontent.fmnl4-4.fna&oh=92eeacd8ea7a2b6dd1cd8af8a1f8e7c1&oe=60CAB366",
      title: "I Love Villa Caceres",
      image: "https://scontent.fmnl4-1.fna.fbcdn.net/v/t1.15752-9/200855241_320209512926695_3536651271392508159_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeFnrQ6jDeSb9x0whFj1BSkCcRBD9_NrH39xEEP382sffwt8_z9sffG1WCZQnnrYSaWmoxQ-1pf0MfIFkgbqj4qV&_nc_ohc=nG56AtFAA74AX8h4S54&tn=pcxqeWzxDFjP9lD4&_nc_ht=scontent.fmnl4-1.fna&oh=d6d1764cbfd2bb3d88e2f6b36f10836f&oe=60CC37A9",),
  Post(
      name: "Jamewell",
      profile: "https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/128445498_710295123024991_1297031469440051548_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeH7WtS--Ff-jXJFMdAN4P_KuIENsUQS9I24gQ2xRBL0jfBGNBTN01Yqkc7h8wCmyBM4E3QAenhKOZg6Uwr866vk&_nc_ohc=PyjNKYkss2QAX9rqH0z&_nc_ht=scontent.fmnl4-6.fna&oh=2757a94d234c178851b396ada231cb84&oe=60CCA737",
      title: "Villa Caceres Accepted Villboard Mobile and Web Application",
      image: "https://scontent.fmnl4-6.fna.fbcdn.net/v/t1.6435-9/196724745_6413964071950746_8642258441757373834_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=8bfeb9&_nc_eui2=AeFP5Q97AEcShyoRFwDrPaxXbtlzKGwSb_Ru2XMobBJv9N79B0W0Q1I2CVYDTzggAbVAjjCJ6DR9sod9ou1vwjWq&_nc_ohc=M9-pjSOQQq8AX878Vtw&_nc_ht=scontent.fmnl4-6.fna&oh=acebe2429083c53afd31ac1b6009046d&oe=60CCAF6C",),


];
