// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitor/authentication/model/user_model.dart';
import 'package:visitor/authentication/services/base_url.dart';
import 'package:visitor/authentication/view_model/Auth_view_provider.dart';
import 'package:visitor/authentication/view_model/db_provider.dart';
import 'package:visitor/core/utils/base/base_viewmodel.dart';
import 'package:http/http.dart' as http;

class AuthViewModel extends BaseViewModel {
  AuthViewModel({required BuildContext context});

  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  bool _isLoading = false;
  bool _isStatusError = false;
  UserData _userdata = UserData();

  UserData get userdata => _userdata;
  set userdata(UserData value) {
    _userdata = value;
    notifyListeners();
  }

  bool get isStatusError => _isStatusError;
  set isStatusError(bool value) {
    _isStatusError = value;
    notifyListeners();
  }

  bool get isPasswordVisible => _isPasswordVisible;
  set isPasswordVisible(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  set isConfirmPasswordVisible(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<http.Response> signUp({
    required String addressNumber,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();
    String url = BaseUrl.baseUrl + BaseUrl.signUp;

    _userdata.email = email;
    _userdata.firstname = firstName;
    _userdata.lastname = lastName;
    _userdata.password = password;

    Map<String, dynamic> requestBody = _userdata.toJson();
    try {
      // Send an HTTP POST request to register the user
      http.Response req = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (req.statusCode == 200) {
        Map<String, dynamic> res = jsonDecode(req.body);
        print('response is ${req.body}');

        _isLoading = false;
        notifyListeners();
      } else {
        Map<String, dynamic> res = jsonDecode(req.body);
        print('Registration failed: ${req.body}');

        _isLoading = false;
        notifyListeners();
      }

      return req;
    } catch (error) {
      // Handle any errors that occur during the HTTP request
      print('Error during registration: $error');
      return http.Response('Error during registration: $error', 500);
    }
  }

  Future<http.Response> signIn({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();
    String url = BaseUrl.baseUrl + BaseUrl.signIn;

    _userdata.email = email;
    _userdata.password = password;

    Map<String, dynamic> requestBody = _userdata.toJson();
    try {
      // Send an HTTP POST request to register the user
      http.Response req = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (req.statusCode == 200) {
        print(req.body);
        // print('test===${req}');
        Map<String, dynamic> res = jsonDecode(req.body);
        _isLoading = false;
        notifyListeners();
        final userId = res['data']['id'];
        final token = res['data']['token'];
        DatabaseProvider().saveToken(token);
        DatabaseProvider().saveUserId(userId);
      } else {
        Map<String, dynamic> res = jsonDecode(req.body);

        print('Registration failed: ${req.body}');

        _isLoading = false;
        notifyListeners();
      }

      return req;
    } catch (error) {
      // Handle any errors that occur during the HTTP request
      print('Error during registration: $error');
      return http.Response('Error during registration: $error', 500);
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
}
