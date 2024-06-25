import 'package:comments/constants/regex_exp.dart';

class Validations {
  static bool isEmailValid(String email) {
    return RegexExp().email.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    ///Here we can also regex if we want
    return password.length > 5;
  }

  static bool isNameValid(String name) {
    return name.length > 2;
  }
}
