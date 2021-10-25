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

  addUser(email,firstName,lastName,middleInitial,address,phoneNumber,password) async {
    return await dio.post('https://villauth.herokuapp.com/addUser',
          data: {"email": email, "firstName":firstName, "lastName": lastName,"middleInitial": middleInitial ,"address": address,"phoneNumber":phoneNumber, "password": password }, 
          options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  
  
getinfo(token) async {
  dio.options.headers['Authorization'] = 'Bearer $token';
  return await dio.get('https://villauth.herokuapp.com/getinfo');
}

addSuggestion(name,suggestions) async {
   try{
    return await dio.post('https://villauth.herokuapp.com/addSuggestion',
       data: {"name": name,"suggestions":suggestions},
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
