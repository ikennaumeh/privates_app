import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/utilities/email_util.dart';
import 'package:privates_app/ui/utilities/password_util.dart';
import 'package:privates_app/ui/utilities/text_util.dart';

class Validator {
  static String? validateEmail(String? s) {
    if (TextUtil.isEmpty(s)) {
      return S.current.email_address_can_not_be_empty;
    } else if (!EmailUtil.isValidEmail(s!)) {
      return S.current.email_must_be_a_valid_email_address;
    } else {
      return null;
    }
  }

  static String? validateFirstName(String? s) {
    if (TextUtil.isEmpty(s)) {
      return S.current.first_name_can_not_be_empty;
    } else {
      return null;
    }
  }
  static String? validateFullName(String? s) {
    if (TextUtil.isEmpty(s)) {
      return S.current.full_name_can_not_be_empty;
    } else {
      return null;
    }
  }

  static String? validateLastName(String? s) {
    if (TextUtil.isEmpty(s)) {
      return S.current.last_name_can_not_be_empty;
    } else {
      return null;
    }
  }

  static String? validateMobile(String? s) {
    if (TextUtil.isEmpty(s)) {
      return S.current.mobile_number_can_not_be_empty;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? s) {
    if (TextUtil.isEmpty(s)) {
      return S.current.password_can_not_be_empty;
    } else if (s!.length < 6) {
      return S.current.password_must_be_greater_than_six;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? s, {String? password}) {
    if (TextUtil.isEmpty(s)) {
      return S.current.password_can_not_be_empty;
    } else if (password != s) {
      return S.current.passwords_do_not_match;
    } else {
      return null;
    }
  }

  static String? validateNewPassword(String? s) {
    if (TextUtil.isEmpty(s)) {
      return S.current.password_can_not_be_empty;
    } else if (s!.length < 4) {
      return S.current.password_must_be_greater_than_six;
    } else if (!PasswordUtil.hasLowerCase(s)) {
      return S.current.password_must_contain_lower_case;
    } else if (!PasswordUtil.hasUpperCase(s)) {
      return S.current.password_must_contain_upper_case;
    } else if (!PasswordUtil.hasSymbol(s)) {
      return S.current.password_must_contain_symbol;
    } else if (!PasswordUtil.hasNumber(s)) {
      return S.current.password_must_contain_number;
    } else {
      return null;
    }
  }
}