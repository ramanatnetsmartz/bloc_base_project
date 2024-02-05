extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^([a-zA-Z0-9-#?!@$ %^&*]).{7,7}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidProductionCode {
    final productionCodeRegExp = RegExp(r'^F\d{5}');
    return productionCodeRegExp.hasMatch(this);
  }
}
