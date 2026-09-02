import 'package:final_project/core/utils/app_strings.dart';

class Validator {
  static String? validateEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]{6,}@gmail\.com$');

    if (email.isEmpty) {
      return AppStrings.emailRequired;
    } else if (!email.split("@")[0].contains(RegExp(r'^.{6,}$'))) {
      return AppStrings.emailMinLength;
    } else if (!regex.hasMatch(email)) {
      if (!email.contains("@gmail.com")) {
        return AppStrings.emailMustEndGmail;
      } else {
        return AppStrings.emailInvalidFormat;
      }
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return AppStrings.fieldRequired;
    }
    if (password.length < 8) {
      return AppStrings.passwordAtLeast8Char;
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return AppStrings.passwordAtLeast1Uppercase;
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return AppStrings.passwordAtLeast1Lowercase;
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      return AppStrings.passwordAtLeast1Number;
    }
    if (!RegExp(r'[@$!%*?&]').hasMatch(password)) {
      return AppStrings.passwordAtLeast1SpecialChar;
    }
    // if (passwordController.text != confirmPassController.text) {
    //   return AppStrings.passwordNotTheSame;
    // }
    return null;
  }

  static String? validateID(String id) {
    final regex = RegExp(r'^\d{14}$');

    if (id.isEmpty) {
      return AppStrings.idRequired;
    } else if (!regex.hasMatch(id)) {
      return AppStrings.idInvalid;
    }
    return null;
  }

  static String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return AppStrings.phoneRequired;
    }
    if (!RegExp(r'^01[0125]').hasMatch(phoneNumber)) {
      return AppStrings.phoneInvalidStart;
    }
    if (phoneNumber.length != 11) {
      return AppStrings.phoneInvalidLength;
    }
    if (!RegExp(r'^\d{11}$').hasMatch(phoneNumber)) {
      return AppStrings.phoneInvalidFormat;
    }
    return null;
  }

  static String? validateUserName(String userName) {
    final regex = RegExp(r'^[a-zA-Z][a-zA-Z0-9_ ]{2,}$');
    if (userName.isEmpty) {
      return AppStrings.usernameRequired;
    } else if (!RegExp(r'^[a-zA-Z]').hasMatch(userName)) {
      return AppStrings.usernameMustStartWithLetter;
    } else if (userName.length < 3) {
      return AppStrings.usernameMinLength;
    } else if (!regex.hasMatch(userName)) {
      return AppStrings.usernameInvalidFormat;
    } else if (userName.replaceAll(RegExp(r'[^a-zA-Z]'), '').length < 3) {
      return AppStrings.usernameMustContainAtLeast3Letters;
    }
    return null;
  }
}
