import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static SharedPreferences preferences;


  static const IDemail = 'email';
  static const IDfirstName = 'firstName';
  static const IDlastName = 'lastName';
  static const IDmiddleInitial = 'middleInitial';
  static const IDaddress = 'address';
  static const IDphoneNumber = 'phoneNumber';

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future setfirstName(String firstName) async =>
      await preferences.setString(IDfirstName, firstName);

  static String getfirstName() => preferences.getString(IDfirstName);

  static Future setlastName(String lastName) async =>
      await preferences.setString(IDlastName, lastName);

  static String getlastName() => preferences.getString(IDlastName);

  static Future setmiddleInitial(String middleInitial) async =>
      await preferences.setString(IDmiddleInitial, middleInitial);

  static String getmiddleInitial() => preferences.getString(IDmiddleInitial);

  static Future setaddress(String address) async =>
      await preferences.setString(IDaddress, address);

  static String getaddress() => preferences.getString(IDaddress);

    static Future setphoneNumber(String phoneNumber) async =>
      await preferences.setString(IDphoneNumber, phoneNumber);

  static String getphoneNumber() => preferences.getString(IDphoneNumber);

      static Future setemail(String email) async =>
      await preferences.setString(IDemail, email);

  static String getemail() => preferences.getString(IDemail);


}
