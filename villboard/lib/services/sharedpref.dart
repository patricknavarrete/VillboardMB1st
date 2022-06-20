import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static SharedPreferences preferences;

  static const IDemail = 'email';
  static const IDfirstName = 'firstName';
  static const IDlastName = 'lastName';
  static const IDmiddleInitial = 'middleInitial';
  static const IDaddress = 'address';
  static const IDphoneNumber = 'phoneNumber';
  static const IDpetField = 'petField';
  static const IDcarField = 'carField';
  static const ID_id = '_id';
  static const ID_profilePic = 'profilePic';

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

  static Future setpetField(String petField) async =>
      await preferences.setString(IDpetField, petField);

  static String getpetField() => preferences.getString(IDpetField);

  static Future setcarField(String carField) async =>
      await preferences.setString(IDcarField, carField);

  static String getcarField() => preferences.getString(IDcarField);

  static Future set_id(String _id) async =>
      await preferences.setString(ID_id, _id);

  static String get_id() => preferences.getString(ID_id);

  static Future set_profilePic(String profilePic) async =>
      await preferences.setString(ID_profilePic, profilePic);

  static String get_profilePic() => preferences.getString(ID_profilePic);
}
