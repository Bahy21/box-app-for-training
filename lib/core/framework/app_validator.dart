import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AppValidator {
  static nameValidator() {
    return (String? value) {
      if (value == null || value.trim().isEmpty) {
        return LocaleKeys.emptyName.tr();
      }

      List<String> nameParts = value.trim().split(RegExp(r'\s+'));

      if (nameParts.length < 3) {
        return LocaleKeys.thirdName.tr();
      }

      return null;
    };
  }

  static stcPayValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyStcPay.tr();
      }
      return null;
    };
  }

  static stcPayCompanyValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.enterStcPayCompany.tr();
      }
      return null;
    };
  }

  static nameCompanyValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyCompanyName.tr();
      }
      return null;
    };
  }

  static orderNumValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyOrderNum.tr();
      }
      return null;
    };
  }

  static descSuggestValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyDescSuggest.tr();
      }
      return null;
    };
  }

  static fullEmailValidator() {
    return (value) {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyEmail.tr();
      } else if (!emailRegex.hasMatch(value)) {
        return LocaleKeys.validEmail.tr();
      }
      return null;
    };
  }

  static emailValidator() {
    return (value) {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
      if (!emailRegex.hasMatch(value ?? '')) {
        return LocaleKeys.validEmail.tr();
      }
      return null;
    };
  }

  static otpValidator() {
    return (value) {
      RegExp regex = RegExp(r'^\d{4}$');

      if (value == null || value.isEmpty) {
        return LocaleKeys.pinCodeEmpty.tr();
      } else if (!regex.hasMatch(value)) {
        return LocaleKeys.pinCodeValid.tr();
      }
      return null;
    };
  }

  static dropDownCityValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyCity.tr();
      }
      return null;
    };
  }

  static dropDownProfCompanyValidator() {
    return (List<dynamic>? values) {
      if (values == null || values.isEmpty) {
        return LocaleKeys.emptyProfCompany.tr();
      }
      return null;
    };
  }

  static dropDownProfTechValidator() {
    return (List<dynamic>? values) {
      if (values == null || values.isEmpty) {
        return LocaleKeys.emptyProfTech.tr();
      }
      return null;
    };
  }

  static imageIdValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyImageIdFile.tr();
      }
      return null;
    };
  }

  static idValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyId.tr();
      }
      return null;
    };
  }

  static walletValueValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyValueCharge.tr();
      }
      return null;
    };
  }

  static imageCommerceValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyImageCommerceFile.tr();
      }
      return null;
    };
  }

  static commerceValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyCommerceNum.tr();
      }
      return null;
    };
  }

  static notesValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyNotes.tr();
      }
      return null;
    };
  }

  static couponValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyCouponCode.tr();
      }
      return null;
    };
  }

  static priceValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyPrice.tr();
      }
      return null;
    };
  }

  static phoneValidator() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.emptyPhone.tr();
      }

      final RegExp regex = RegExp(r'^5\d{8}$');
      if (!regex.hasMatch(value)) {
        return LocaleKeys.validatePhone.tr();
      }

      return null;
    };
  }
}
