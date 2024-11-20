class ApiConstants {
  
  static const String domainName = "https://olgoo-dev.liara.run/";
  static const String login = "otp/";//send phone number as param
  static const String signup = "user";//body -- name  ,phoneNumber , companyTitle
  static const String verfiyOtp = "otpVerify";//takes jason body -- phoneNumber , otp 
  //! otpverfiy ex : 9391556862  -- no 0 in first of phone number
  static const String getCompany = "company/";//takes jason body -- phoneNumber , otp
}
