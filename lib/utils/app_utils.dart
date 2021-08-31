import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math' as math;
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_view_app/widgets/app_dialog.dart';
import 'package:web_view_app/widgets/pay_dailog.dart';
import 'package:web_view_app/utils/extensions.dart';

class AppUtils {

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Helper function to compare two dates
  /// Returns True if both dates are the same
  static bool compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  static List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }

    return days;
  }

  static String generateGuid() {
   math.Random random = math.Random(new DateTime.now().millisecond);

    final String hexDigits = "0123456789abcdef";
    final List<String> uuid = List<String>(36);

    for (int i = 0; i < 36; i++) {
      final int hexPos = random.nextInt(16);
      uuid[i] = (hexDigits.substring(hexPos, hexPos + 1));
    }

    int pos = (int.parse(uuid[19], radix: 16) & 0x3) | 0x8; // bits 6-7 of the clock_seq_hi_and_reserved to 01

    uuid[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    uuid[19] = hexDigits.substring(pos, pos + 1);

    uuid[8] = uuid[13] = uuid[18] = uuid[23] = "-";

    final StringBuffer buffer = new StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }

  static Future<bool> hasInternetConnection() async {
    return await DataConnectionChecker().hasConnection;
  }

  static void showSnakeBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg, style: TextStyle(fontSize: 18.sp),
          ),
        ),
    );
  }

  static showToast({@required msg, Color bgColor, Toast toastLength}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      backgroundColor: bgColor ?? Colors.red,
      textColor: Colors.white,
      fontSize: 14.0.sp,
    );
  }

  static Future showAppDialog(BuildContext context, Widget child, {double width, double height, bool showCloseButton = true, bool useCancelDefaultButton = true, bool useMargin = true}) async {
    return await showDialog(
      context: context,
      builder: (context) => AppDialogContent(
        child: child,
        width: width,
        height: height,
        useMargin: useMargin,
        showCloseButton: showCloseButton,
        useCancelDefaultButton: useCancelDefaultButton,
      ),
    );
  }

  static String getOrderNumber(String currentOrderNumber) {
      String i = currentOrderNumber, result = "";
      int num;
      try {
        num = int.parse(i);
      } catch (e) {
        num = 4;
      }
      result = (++num).toString();
      if(i != null) {
        for (int c = 0; c < i.length; c++) {
          if (result.length < i.length) {
            result = "0" + result;
          }
      }
    }

    return result;
  }

  static showPayDialog(BuildContext context, Widget child, {double borderRadius}) async {
    return await showDialog(
      context: context,
      builder: (context) => PayDialog(
        child: child,
        borderRadius: borderRadius,
      ),
    );
  }

  static void exitFromApp() {
    exit(0);
  }

  static String getRandomId() {
    return (math.Random().nextInt(1000000000) + 1000000000).toString();
  }

  static String getRandomId4Digits() {
    return (math.Random().nextInt(9999)).toString();
  }

  static double calcPriceWithoutTax({double taxPercent, double priceFromPricePolicy, int quantity = 1}) {
    return (priceFromPricePolicy / (1 + (taxPercent / 100))) * quantity;
  }

  static double calcTaxValue({double priceBeforeTax, int quantity, double discount, double taxPercent}) {
    return (priceBeforeTax * quantity - discount) * ((taxPercent ?? 0.0) / 100);
  }

  static double calcPriceWithTax({double priceWithoutTax, int quantity, double discount, double taxValue}) {
    return ((priceWithoutTax * quantity) - discount) + (taxValue);
  }

  static Timer startTimeout(BuildContext context, {int minutes}) {
    print('start timer');
    var duration = Duration(minutes: minutes ?? 120);
    return Timer(duration, () {
      handleTimeout(context);
    });
  }

  static void handleTimeout(BuildContext context) async {
    dev.log('user timeout');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CashierLoginPage()),);
  }
}
