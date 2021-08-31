
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_view_app/utils/app_localization.dart';
import 'package:web_view_app/utils/consts.dart';

import 'login/presentation/pages/login_page.dart';
import 'widgets/custom_scroll_behavior.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String langCode = sharedPreferences.getString(SharedPreferencesKeys.lang_code) ?? 'ar';
  bool isLoggedIn = sharedPreferences.getBool(SharedPreferencesKeys.is_loggedIn) ?? false;

  runApp(MainScreen(languageCode: langCode, isLoggedIn: isLoggedIn,));
}

class MainScreen extends StatefulWidget {
  final String languageCode;
  final bool isLoggedIn;

  MainScreen({Key key, @required this.languageCode, this.isLoggedIn = false}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MainScreenState state = context.findAncestorStateOfType<_MainScreenState>();
    state.setState(() {
      state._locale = locale;
    });
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Locale _locale;
  bool isLoggedIn;

  @override
  void initState() {
    super.initState();

    isLoggedIn = widget.isLoggedIn;
    setLanguage();
  }

  setLanguage() {
    _locale = Locale(widget.languageCode);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.languageCode == 'ar' ? APP_NAME_AR : APP_NAME_EN,
      locale: _locale,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('ar'), // Arabic
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primaryColor: mainColor,
        accentColor: secondColor,
        fontFamily: widget.languageCode == 'ar' ? 'Cairo' : 'SF',
      ),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          ),
          child: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: child,
          ),
        );
      },
      home: Builder(
        builder: (context) {
          Widget page;
          if (this.isLoggedIn) {
            page = LoginPage();
          } else {
            page = LoginPage();
          }

          ScreenUtil.init(context, designSize: Size(412, 870), allowFontScaling: true);
          return Directionality(
            textDirection:
            Localizations.localeOf(context).languageCode == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,

            child: page,
          );
        },
      ),
    );
  }
}
