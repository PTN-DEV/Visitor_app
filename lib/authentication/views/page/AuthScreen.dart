import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:visitor/authentication/views/page/Login.dart';
import 'package:visitor/authentication/views/page/registe_user.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/authentication/views/widgets/AuthButton.dart';
import 'package:visitor/authentication/views/widgets/Poontana.dart';

class AuthScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const PoontanaHeader(),
            Image(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 1,
              image: const AssetImage('assets/map.png'),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: RichText(
                  text: TextSpan(
                      text: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                          color: Colors.black))),
            ),
            AuthButton(
              fn: () {
                Navigator.push(context, Login.route());
              },
              btnHeight: MediaQuery.sizeOf(context).height * 0.05,
              btnWidth: MediaQuery.sizeOf(context).width * 0.8,
              title: 'เข้าสู่ระบบ',
              color: ColorPalette.greenBtn,
              titleColor: ColorPalette.white,
              borderColor: ColorPalette.greenBtn,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: AuthButton(
                btnHeight: MediaQuery.sizeOf(context).height * 0.05,
                btnWidth: MediaQuery.sizeOf(context).width * 0.8,
                fn: () {
                  Navigator.push(context, RegisterUser.route());
                },
                title: 'สมัครสมาชิก',
                color: ColorPalette.white,
                titleColor: ColorPalette.greenBtn,
                borderColor: ColorPalette.greenBtn,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'version x.x.x.(x)',
                style: TextStyle(color: ColorPalette.greenBtn, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
