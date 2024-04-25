import 'package:flutter/material.dart';
import 'package:visitor/authentication/view_model/Auth_view_model.dart';
import 'package:visitor/authentication/view_model/forgetpassword_view_model.dart';
import 'package:visitor/authentication/views/widgets/Poontana_backBtn.dart';
import 'package:visitor/core/utils/base/baseScree.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/authentication/views/widgets/AuthButton.dart';
import 'package:visitor/authentication/views/widgets/Poontana.dart';
import 'package:visitor/authentication/views/widgets/header_withTitle.dart';
import 'package:visitor/authentication/views/widgets/textformfield.dart';

class ConfirmUpdatePassword extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ConfirmUpdatePassword(),
      );
  const ConfirmUpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        viewmodel: ForgetPwViewModel(context: context),
        builder: (builder, viewmodel, child, devicescreen) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 50),
              child: _mainContent(context, viewmodel),
            ),
          );
        });
  }

  Widget _mainContent(BuildContext context, ForgetPwViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoontanaHeaderWithBtn(),
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 35, right: 35),
          child: HeaderWithTitle(
              header: 'อัพเดทรหัสผ่าน',
              titleText: 'กรุณาอัพเดทรหัสผ่านใหม่เพื่อเข้าสู่ระบบ'),
        ),
        Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              TextFormFieldAuth(
                inputLabel: 'รหัสผ่านใหม่',
                hintText: 'รหัสผ่านใหม่',
                obscureText: true,
                controller: viewModel.newPasswordController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormFieldAuth(
                  inputLabel: 'รหัสผ่านใหม่',
                  hintText: 'รหัสผ่านใหม่',
                  obscureText: true,
                  controller: viewModel.confirmNewPasswordController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: AuthButton(
                    fn: () {
                      // print(viewModel.newPasswordController.text);
                      // print(viewModel.confirmNewPasswordController.text);
                    },
                    title: 'ยืนยันการอัพเดตรหัสผ่าน',
                    color: ColorPalette.greenBtn,
                    titleColor: ColorPalette.white,
                    borderColor: ColorPalette.greenBtn),
              )
            ],
          ),
        )
      ],
    );
  }
}
