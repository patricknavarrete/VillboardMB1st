import 'package:flutter/material.dart';
import 'package:villboard/services/authservice.dart';

class Post {
  final String name;
  final String profile;
  final String title;
  final String image;
  final String createdAt;
  Post({
    this.name,
    this.profile,
    this.title,
    this.image,
    this.createdAt,
  });
}

class Pet {
  final String pFirstName;
  final String pLastName;
  final String pAddress;
  final String pPhoneNumber;
  final String petName;
  final String petBreed;
  final String pQR;
  final String createdAt;
  final String pEmail;

  Pet({
        this.pFirstName,
        this.pLastName,
        this.pAddress,
        this.pPhoneNumber,
        this.petName,
        this.petBreed,
        this.pQR,
        this.createdAt,
        this.pEmail,
      });
}

class Car {
  final String cFirstName;
  final String cLastName;
  final String cAddress;
  final String cPhoneNumber;
  final String vehicleModel;
  final String plateNumber;
  final String cQR;
  final String createdAt;
  final String cEmail;

  Car({
    this.cFirstName,
    this.cLastName,
    this.cAddress,
    this.cPhoneNumber,
    this.vehicleModel,
    this.plateNumber,
    this.cQR,
    this.createdAt,
    this.cEmail
  });
}


class Member {
  final String aFirstName;
  final String aLastName;
  final String aAddress;
  final String aPhoneNumber;
  final String userID;
  final String createdAt;
  final String aEmail;
  final String member;

  Member({
    this.aFirstName,
    this.aLastName,
    this.aAddress,
    this.aPhoneNumber,
    this.userID,
    this.createdAt,
    this.aEmail,
    this.member
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
