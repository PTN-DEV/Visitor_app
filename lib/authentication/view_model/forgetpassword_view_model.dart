import 'package:flutter/material.dart';
import 'package:visitor/core/utils/base/base_viewmodel.dart';

class ForgetPwViewModel extends BaseViewModel {
  ForgetPwViewModel({required BuildContext context});
  bool _isTypeOtp = false;
  bool get isTypeOtp => _isTypeOtp;
  set isPasswordVisible(bool value) {
    _isTypeOtp = value;
    notifyListeners();
  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController state1 = TextEditingController();
  TextEditingController state2 = TextEditingController();
  TextEditingController state3 = TextEditingController();
  TextEditingController state4 = TextEditingController();
  TextEditingController state5 = TextEditingController();
  TextEditingController state6 = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
}
