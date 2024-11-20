import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/features/domain/auth/entity/user.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesOprator {
  late SharedPreferences preferences;
  PreferencesOprator(this.preferences) {
    preferences = locator<SharedPreferences>();
  }
  String? getAccToken() {
    String? token = preferences.getString('acctoken');
    //ترجمه 
    // اکساپایر تایم
    // 
    return token;
  }   
  String? getRefToken() {
    String? token = preferences.getString('reftoken');
    return token;
  }
  void refreshAccessToken(){}
  void logout(){}
  void refreshRefToken(){}

  void saveUserData(UserEntity user){
   preferences.setString('userName', user.name!);
   preferences.setString('userPhone', user.phone!);
   preferences.setString('userId', user.id!.toString());
   preferences.setString('role', user.role![0].toString());
     preferences.setString('acctoken',user.accToken!);
     preferences.setString('reftoken',user.refToken!);
  }
  void saveUserDataWithOutToken(UserEntity user){
   preferences.setString('userName', user.name!);
   preferences.setString('userPhone', user.phone!);
   preferences.setString('userId', user.id!.toString());
  }
  Map<String , dynamic> getUserData()  {
  final String? name = preferences.getString('userName');
  final String? phoneNumber = preferences.getString('userPhone');
  final String? id = preferences.getString('userId');
  return {
    'name': name ?? '',
    'phoneNumber': phoneNumber ?? '',
    'id': id ?? '',
  };
}
  bool isUserWatchedOnboarding(){
    return preferences.getBool('onboarding-seen')??false;
  }
  void userSeenOnboarding(){
    preferences.setBool('onboarding-seen',true);
  }

  void saveCompanyInfo(String id , String name ){
   preferences.setString('company-name', name);
   preferences.setString('company-id', id);
  }
  Map<String,dynamic> getCompanyInfo(){
  final String? name = preferences.getString('company-name');
  final String? id = preferences.getString('company-id');
  return {
    'name': name ?? '',
    'id': id ?? '',
  };

  }
  bool  isUserLoggedInBefor() {
    String? result = preferences.getString('reftoken');
    if (result != null) {
      return true;
    } else {
      return false;
    }
  }

}
