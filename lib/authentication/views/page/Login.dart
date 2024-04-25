import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visitor/authentication/view_model/Auth_view_model.dart';
import 'package:visitor/authentication/views/page/forget_password.dart';
import 'package:visitor/authentication/views/page/registe_user.dart';
import 'package:visitor/authentication/views/widgets/Poontana_backBtn.dart';
import 'package:visitor/core/utils/base/baseScree.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/authentication/views/widgets/AuthButton.dart';
import 'package:visitor/authentication/views/widgets/Poontana.dart';
import 'package:visitor/authentication/views/widgets/header_withTitle.dart';
import 'package:visitor/authentication/views/widgets/textformfield.dart';
import 'package:visitor/homepage/page/mainHomePage.dart';

class Login extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const Login(),
      );
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        viewmodel: AuthViewModel(context: context),
        builder: (context, viewmodel, child, deviceScreen) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: _mainContent(context, viewmodel),
            ),
          );
        });
  }

  Widget _mainContent(
    BuildContext context,
    AuthViewModel viewmodel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const PoontanaHeaderWithBtn(),
        const Padding(
            padding: EdgeInsets.only(top: 40, left: 35, right: 35),
            child: HeaderWithTitle(
              header: 'เข้าสู่ระบบ',
              titleText: 'กรุณาเข้าสู่ระบบเพื่อเข้าใช้งาน POON eVisitor',
            )),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.05,
              left: MediaQuery.sizeOf(context).width * 0.01,
              right: MediaQuery.sizeOf(context).width * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormFieldAuth(
                formHeight: MediaQuery.sizeOf(context).height * 0.05,
                formWidth: MediaQuery.sizeOf(context).width * 0.8,
                inputLabel: 'อีเมล',
                hintText: 'อีเมล',
                controller: viewmodel.emailController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormFieldAuth(
                  formHeight: MediaQuery.sizeOf(context).height * 0.05,
                  formWidth: MediaQuery.sizeOf(context).width * 0.8,
                  inputLabel: 'รหัสผ่าน',
                  hintText: 'รหัสผ่าน',
                  controller: viewmodel.passwordController,
                  sfIcon: const Icon(Icons.visibility),
                  sfIconOff: const Icon(Icons.visibility_off),
                  suffix: InkWell(
                    onTap: () {
                      viewmodel.isPasswordVisible =
                          !viewmodel.isPasswordVisible;
                      print(viewmodel.emailController.text);
                    },
                    child: Icon(
                      viewmodel.isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 16,
                    ),
                  ),
                  obscureText: viewmodel.isPasswordVisible,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.05),
                child: AuthButton(
                    btnHeight: MediaQuery.sizeOf(context).height * 0.05,
                    btnWidth: MediaQuery.sizeOf(context).width * 0.8,
                    fn: () async {
                      var req = await viewmodel.signIn(
                          email: viewmodel.emailController.text,
                          password: viewmodel.passwordController.text);

                      Map<String, dynamic> res = jsonDecode(req.body);

                      if (res['response_status'] != 'ERROR') {
                        Navigator.pushReplacement(
                            context, MainHomePage.route());
                        viewmodel.emailController.clear();
                        viewmodel.passwordController.clear();
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
                    title: 'เข้าสุ่ระบบ',
                    color: ColorPalette.greenBtn,
                    titleColor: ColorPalette.white,
                    borderColor: ColorPalette.greenBtn),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.02,
              left: MediaQuery.sizeOf(context).width * 0.1,
              right: MediaQuery.sizeOf(context).width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.push(context, RegisterUser.route()),
                child: RichText(
                  text: const TextSpan(
                    text: 'สมัครสมาชิก',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        color: ColorPalette.greenBtn,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    Navigator.push(context, ForgetPasswordPage.route()),
                child: RichText(
                  text: const TextSpan(
                    text: 'ลืมรหัสผ่าน?',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        color: ColorPalette.grey,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).width * 0.05,
              left: MediaQuery.sizeOf(context).width * 0.1,
              right: MediaQuery.sizeOf(context).width * 0.1,
              bottom: MediaQuery.sizeOf(context).height * 0.05),
          child: const Image(
            alignment: Alignment.centerLeft,
            image: AssetImage('assets/orLogo.png'),
          ),
        ),
        AuthButton(
          btnHeight: MediaQuery.sizeOf(context).height * 0.05,
          btnWidth: MediaQuery.sizeOf(context).width * 0.8,
          title: 'ดำเนินการด้วยLINE',
          color: ColorPalette.white,
          titleColor: ColorPalette.blacke45,
          borderColor: ColorPalette.greenBtn,
          logoLeft: (const CircleAvatar(
            radius: 15,
            child: Image(
              image: AssetImage('assets/line.png'),
            ),
          )),
        ),
      ],
    );
  }
}
