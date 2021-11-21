import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:villboard/screens/changepassword.dart';
import 'package:villboard/screens/suggestionbox.dart';

class AuthService {
  Dio dio = new Dio();

  login(email, password) async {
    try {
      return await dio.post(
        'https://villauth.herokuapp.com/authenticate',
          data: {"email": email, "password": password
          }, options: Options(contentType: Headers.formUrlEncodedContentType)
          );
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }


  

  addUser(formData) async {
    try{
    return await dio.post('https://villauth.herokuapp.com/adduser',
          data: formData, 
          options: Options(contentType: Headers.formUrlEncodedContentType));
            } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
    
   }  
  

  
  
getinfo(token) async {
  dio.options.headers['Authorization'] = 'Bearer $token';
  return await dio.get('https://villauth.herokuapp.com/getinfo');
}

addSuggestion(aName,suggestions) async {
   try{
    return await dio.post('https://villauth.herokuapp.com/addSuggestion',
       data: {"aName": aName,"suggestions":suggestions},
       options: Options(contentType: Headers.formUrlEncodedContentType));

       } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  addReservation(rFirstName,rLastName,rAddress,rPhoneNumber,venue,reservationTime,reservationDate,email) async {
   try{
    return await dio.post('https://villauth.herokuapp.com/addReservation',
       data: {"rFirstName": rFirstName,"rLastName":rLastName, "rAddress": rAddress, "rPhoneNumber":rPhoneNumber,"venue": venue,"reservationTime": reservationTime,"reservationDate":reservationDate,"email":email},
       options: Options(contentType: Headers.formUrlEncodedContentType));

       } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }  

  addCar(cFirstName,cLastName,cAddress,cPhoneNumber,vehicleModel,plateNumber,email) async {
   try{
    return await dio.post('https://villauth.herokuapp.com/addCar',
       data: {"cFirstName": cFirstName,"cLastName":cLastName, "cAddress": cAddress, "cPhoneNumber":cPhoneNumber,"vehicleModel": vehicleModel,"plateNumber": plateNumber,"email":email},
       options: Options(contentType: Headers.formUrlEncodedContentType));

       } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }  

  addPet(pFirstName,pLastName,pAddress,pPhoneNumber,petName,petBreed,email) async {
   try{
    return await dio.post('https://villauth.herokuapp.com/addPet',
       data: {"pFirstName": pFirstName,"pLastName":pLastName, "pAddress": pAddress, "pPhoneNumber":pPhoneNumber,"petName": petName,"petBreed": petBreed,"email":email},
       options: Options(contentType: Headers.formUrlEncodedContentType));

       } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }  

postAnnouncement(postField,postCaption,postCategory,photoUrl) async {
    return await dio.post('https://villauth.herokuapp.com/postAnnouncement',
       data: {"postField": postField,"postCaption": postCaption, "postCategory": postCategory, "photoUrl": photoUrl },
       options: Options(contentType: Headers.formUrlEncodedContentType));
}


changepass(email,password,newpass)async{
  try {
         return await dio.post('https://villauth.herokuapp.com/changepass',
         data: {
            "email": email,
            "password": password,
            "newpass": newpass,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
}

changeFirstname(email,newfirstname)async{
  try {
         return await dio.post('https://villauth.herokuapp.com/changeFirstname',
         data: {
            "email": email,
            "newfirstname": newfirstname,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
}

changeLastname(email,newlastname)async{
  try {
         return await dio.post('https://villauth.herokuapp.com/changeLastname',
         data: {
            "email": email,
            "newlastname": newlastname,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
}

changeMiddleinitial(email,newmiddleinitial)async{
  try {
         return await dio.post('https://villauth.herokuapp.com/changeMiddleinitial',
         data: {
            "email": email,
            "newmiddleinitial": newmiddleinitial,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
}

changeAddress(email,newaddress)async{
  try {
         return await dio.post('https://villauth.herokuapp.com/changeAddress',
         data: {
            "email": email,
            "newaddress": newaddress,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
}

changePhonenumber(email,newphonenumber)async{
  try {
         return await dio.post('https://villauth.herokuapp.com/changePhonenumber',
         data: {
            "email": email,
            "newphonenumber": newphonenumber,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
}


}