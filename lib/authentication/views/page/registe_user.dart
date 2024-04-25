import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:visitor/authentication/view_model/Auth_view_model.dart';
import 'package:visitor/authentication/views/page/Login.dart';
import 'package:visitor/authentication/views/widgets/Poontana_backBtn.dart';
import 'package:visitor/core/utils/base/baseScree.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/authentication/views/widgets/AuthButton.dart';
import 'package:visitor/authentication/views/widgets/header_withTitle.dart';
import 'package:visitor/authentication/views/widgets/textformfield.dart';

class RegisterUser extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const RegisterUser(),
      );
  const RegisterUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        viewmodel: AuthViewModel(context: context),
        builder: (builder, viewmodel, child, devicescreen) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.05),
              child: _mainContent(context, viewmodel),
            ),
          );
        });
  }

  Widget _mainContent(
    BuildContext context,
    AuthViewModel viewmodel,
  ) {
    Response req;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoontanaHeaderWithBtn(),
        Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.04,
                left: MediaQuery.sizeOf(context).width * 0.1,
                right: MediaQuery.sizeOf(context).width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWithTitle(
                    header: 'สมัครสมาชิก',
                    titleText: 'กรุณาสมาชิกเพื่อเข้าสู่ระบบ'),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).width * 0.05),
                  child: const Text(
                    'ข้อมูลทั่วไป',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).width * 0.03),
                        child: TextFormFieldAuth(
                          formHeight: MediaQuery.sizeOf(context).height * 0.05,
                          formWidth: MediaQuery.sizeOf(context).width * 0.8,
                          inputLabel: 'ที่อยู่',
                          controller: viewmodel.addressController,
                          hintText: 'บ้านเลขที่',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).width * 0.01),
                        child: TextFormFieldAuth(
                          formHeight: MediaQuery.sizeOf(context).height * 0.05,
                          formWidth: MediaQuery.sizeOf(context).width * 0.8,
                          inputLabel: 'ชื่อ',
                          controller: viewmodel.firstNameController,
                          hintText: 'ชื่อ',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormFieldAuth(
                          formHeight: MediaQuery.sizeOf(context).height * 0.05,
                          formWidth: MediaQuery.sizeOf(context).width * 0.8,
                          inputLabel: 'นามสกุล',
                          controller: viewmodel.lastNameController,
                          hintText: 'นามสกุล',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: TextFormFieldAuth(
                          formHeight: MediaQuery.sizeOf(context).height * 0.05,
                          formWidth: MediaQuery.sizeOf(context).width * 0.8,
                          inputLabel: 'เบอร์โทรศัพท์',
                          controller: viewmodel.phoneNumberController,
                          hintText: 'เบอร์โทรศัพท์',
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'ข้อมูลผู้ใช้งาน',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: TextFormFieldAuth(
                          formHeight: MediaQuery.sizeOf(context).height * 0.05,
                          formWidth: MediaQuery.sizeOf(context).width * 0.8,
                          inputLabel: 'อีเมล',
                          controller: viewmodel.emailController,
                          hintText: 'อีเมล',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormFieldAuth(
                          formHeight: MediaQuery.sizeOf(context).height * 0.05,
                          formWidth: MediaQuery.sizeOf(context).width * 0.8,
                          inputLabel: 'รหัสผ่าน',
                          obscureText: viewmodel.isPasswordVisible,
                          controller: viewmodel.passwordController,
                          hintText: 'รหัสผ่าน',
                          sfIcon: const Icon(Icons.visibility),
                          sfIconOff: const Icon(Icons.visibility_off),
                          suffix: InkWell(
                            onTap: () {
                              viewmodel.isPasswordVisible =
                                  !viewmodel.isPasswordVisible;
                            },
                            child: Icon(
                              viewmodel.isPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormFieldAuth(
                          formHeight: MediaQuery.sizeOf(context).height * 0.05,
                          formWidth: MediaQuery.sizeOf(context).width * 0.8,
                          inputLabel: 'ยืนยันรหัสผ่าน',
                          obscureText: viewmodel.isPasswordVisible,
                          controller: viewmodel.confirmPasswordController,
                          sfIcon: const Icon(Icons.visibility),
                          sfIconOff: const Icon(Icons.visibility_off),
                          hintText: 'ยืนยันรหัสผ่าน',
                          suffix: InkWell(
                            onTap: () {
                              viewmodel.isPasswordVisible =
                                  !viewmodel.isPasswordVisible;
                            },
                            child: Icon(
                              viewmodel.isPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: AuthButton(
                      fn: () async {
                        req = await viewmodel.signUp(
                            addressNumber: viewmodel.addressController.text,
                            firstName: viewmodel.firstNameController.text,
                            lastName: viewmodel.lastNameController.text,
                            phoneNumber: viewmodel.phoneNumberController.text,
                            email: viewmodel.emailController.text,
                            password: viewmodel.passwordController.text);

                        Map<String, dynamic> res = jsonDecode(req.body);
                        if (res['response_status'] != 'ERROR') {
                          viewmodel.addressController.clear();
                          viewmodel.firstNameController.clear();
                          viewmodel.lastNameController.clear();
                          viewmodel.phoneNumberController.clear();
                          viewmodel.emailController.clear();
                          viewmodel.passwordController.clear();
                          viewmodel.confirmPasswordController.clear();
                          Navigator.pushReplacement(context, Login.route());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                res['message'],
                                style: const TextStyle(
                                    fontFamily: 'kanit', fontSize: 15),
                              ),
                            ),
                          );
                        }
                      },
                      title: 'สมัครสมาชิก',
                      btnHeight: MediaQuery.sizeOf(context).height * 0.05,
                      btnWidth: MediaQuery.sizeOf(context).width * 0.8,
                      color: ColorPalette.greenBtn,
                      titleColor: ColorPalette.white,
                      borderColor: ColorPalette.greenBtn),
                ),
              ],
            )),
      ],
    );
  }
}
