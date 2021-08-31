class PatternUtils {
  static const String _email_pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String _name_pattern = r'^[a-zA-Z]+$';
  static const String _url_pattern = r'(http[s]?:\/\/)?[^\s(["<,>]*\.[^\s[",><]*';
  static const String _egypt_mobile_number_pattern = r'^(01)[0-9]{8}';
  static const String _base64_pattern = r'^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$';
  static const String _ip_address_pattern = r'^(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))\.(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))\.(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))\.(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))$';

  static bool emailIsValid({email}) {
    RegExp emailRegularExpression = RegExp(_email_pattern);
    if (emailRegularExpression.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  static bool nameIsValid({name}) {
    RegExp nameRegularExpression = RegExp(_name_pattern);
    if (nameRegularExpression.hasMatch(name)) {
      return true;
    } else {
      return false;
    }
  }

  static bool urlIsValid({url}) {
    RegExp urlRegularExpression = RegExp(_url_pattern);
    if (urlRegularExpression.hasMatch(url)) {
      return true;
    } else {
      return false;
    }
  }

  static bool ipAddressIsValid({ipAddress}) {
    RegExp urlRegularExpression = RegExp(_ip_address_pattern);
    if (urlRegularExpression.hasMatch(ipAddress)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isBase64Valid({String base64String}) {
    RegExp urlRegularExpression = RegExp(_base64_pattern);
    if (urlRegularExpression.hasMatch(base64String)) {
      return true;
    } else {
      return false;
    }
  }

  // only egyptian phone
  static bool phoneIsValid({phone}) {
    RegExp phoneRegularExpression = RegExp(_egypt_mobile_number_pattern);
    if (phoneRegularExpression.hasMatch(phone)) {
      return true;
    } else {
      return false;
    }
  }
}
