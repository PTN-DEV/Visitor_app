import 'package:flutter/material.dart';
import 'package:visitor/authentication/view_model/Auth_view_model.dart';
import 'package:visitor/authentication/view_model/forgetpassword_view_model.dart';
import 'package:visitor/authentication/views/page/confirmotp_forgetpassword.dart';
import 'package:visitor/authentication/views/widgets/Poontana_backBtn.dart';
import 'package:visitor/core/utils/base/baseScree.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/authentication/views/widgets/AuthButton.dart';
import 'package:visitor/authentication/views/widgets/Poontana.dart';
import 'package:visitor/authentication/views/widgets/header_withTitle.dart';
import 'package:visitor/authentication/views/widgets/textformfield.dart';

class ForgetPasswordPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ForgetPasswordPage(),
      );
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        viewmodel: ForgetPwViewModel(context: context),
        builder: (context, viewmodel, child, deviceScreen) {
          return _mainContent(context, viewmodel);
        });
  }

  Widget _mainContent(BuildContext context, ForgetPwViewModel viewModel) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PoontanaHeaderWithBtn(),
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 35, right: 35),
              child: HeaderWithTitle(
                header: 'ลืมรหัสผ่าน',
                titleText:
                    'กรุณากรอกเบอร์โทรศัพท์เพื่อรับรหัสยืนยันความปลอดภัยสำหรับการอัพเดทรหัสผ่านใหม่',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: TextFormFieldAuth(
                      inputLabel: 'เบอร์โทรศัพท์',

                hintText: 'เบอร์โทรศัพท์',
                controller: viewModel.phoneNumberController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Center(
                  child: Text(
                'กรุณาระบุเบอร์โทรศัพท์ เพื่ออัพเดทรหัสผ่านใหม่',
                style: TextStyle(fontSize: 13, color: ColorPalette.grey),
              )),
            ),
            AuthButton(
                fn: () {
                  (viewModel.phoneNumberController.text != '' &&
                          viewModel.phoneNumberController.text.length == 10)
                      ? Navigator.push(context, ConfirmOtpPassword.route())
                      : print('dsfef');
                },
                title: 'ขอรหัสยืนยันความปลอดภัย',
                color: ColorPalette.greenBtn,
                titleColor: ColorPalette.white,
                borderColor: ColorPalette.greenBtn),
          ],
        ),
      ),
    );
  }
}
