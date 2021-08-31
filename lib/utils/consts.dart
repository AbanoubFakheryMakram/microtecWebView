import 'package:flutter/material.dart';

final bouncingScrollPhysics = BouncingScrollPhysics();

final Color scaffoldBackgroundColor = Color(0xffefefef);
final Color mainColor = Color(0xff1A90B0);
final Color secondColor = Color(0xff5783C7);
final Color loginCardBackgroundColor = Color(0xffF5F5F5);

final String APP_NAME_EN = 'Web View App';
final String APP_NAME_AR = 'تطبيق الويب فيو';

class SharedPreferencesKeys {
  static const String lang_code = 'langCode';
  static const String is_loggedIn = 'isLoggedIn';
  static const String current_user = 'currentUser';
  static const String main_token = 'mainToken';
  static const String dashboard_url = 'dashboardUrl';
}
