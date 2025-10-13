import 'dart:io';

class Constant {

  static Map<String, String> headers(String token) {
    if (token.isNotEmpty) {
      return {
        "Authorization": "Bearer $token",
        HttpHeaders.contentTypeHeader: 'application/json;charset=UTF-8',
        HttpHeaders.acceptHeader: 'application/json',
      };
    }
    return {
      HttpHeaders.contentTypeHeader: 'application/json;charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  static const String db = "";
  static const String appName = "";
  static const String token = "token";
  static const String appVersion = "App version";
  static const String fcmToken = "fcm-token";
  static const String refreshToken = "refresh-token";
  static const String expiredAt = "expired-at";
  static const String role = "user-role";
  static const String callData = "call-data";

  static const String currentUserId = "current-user-id";
  static const String currentEmployeeId = "current-employee-id";
  static const String currentMUserId = "current-m-user-id";
  static const String currentUserImageUrl = "current-user-image-url";
  static const String currentGroupImageUrl = "current-group-image-url";
  static const String currentUserCoverImageUrl = "current-user-cover-image-url";
  static const String currentCompanyId = "current-company-id";
  static const String currentUserName = "current-user-name";
  static const String currentCompanyName = "current-company-name";
  static const String currentUserEmail = "current-user-email";
  static const String currentUserMobile = "current-user-mobile";
  static const String currentUserDesignation = "current-user-designation";
  static const String currentUserDepartment = "current-user-department";
  static const String isLoggedIn = "logged-in";
  static const String isRemember = "remember-me";

  static const int english = 0;
  static const int bangla = 1;

  static const String defaultTheme = "default-theme";
  static const String defaultLanguage = "default-lang";

  static const int accept = 1;
  static const int reject = 2;

  static const String defaultEnv = Constant.staging;

  static const String local = "local";
  static const String staging = "staging";
  static const String production = "production";

  static const String channelId = "_wow_fcm_dgNet_#16112024";
  static const String channelName = "workwave-notification-channel";
  static const String channelDesc = "Send user to user push notification alert for chat, competition, announcement service";

  static const int httpTimeout = 60;
}
