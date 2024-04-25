import 'package:flutter/material.dart';
import 'package:visitor/authentication/view_model/forgetpassword_view_model.dart';
import 'package:visitor/authentication/views/widgets/Poontana_backBtn.dart';
import 'package:visitor/core/utils/base/baseScree.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/authentication/views/widgets/AuthButton.dart';
import 'package:visitor/authentication/views/widgets/Poontana.dart';
import 'package:visitor/authentication/views/widgets/header_withTitle.dart';
import 'package:visitor/authentication/views/widgets/numberbox.dart';

class ConfirmOtpPassword extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ConfirmOtpPassword(),
      );
  const ConfirmOtpPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FocusNode> fnode = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
    return BaseScreen(
        viewmodel: ForgetPwViewModel(context: context),
        builder: (builder, viewmodel, child, devicescreen) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: _mainContent(context, viewmodel, fnode),
            ),
          );
        });
  }

  Widget _mainContent(
    BuildContext buildContext,
    ForgetPwViewModel viewModel,
    List<FocusNode> focusnode,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoontanaHeaderWithBtn(),
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 35, right: 35),
          child: HeaderWithTitle(
              header: 'ยืนยันความปลอดภัย',
              titleText: 'กรุณากรอกรหัสยืนยันความปลอดภัย\nเพื่ออัพเดตรหัสผ่าน'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(buildContext).size.width,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberBox(
                    focusnode: focusnode[0],
                    nextNode: focusnode[1],
                    controller: viewModel.state1,
                  ),
                  NumberBox(
                    focusnode: focusnode[1],
                    nextNode: focusnode[2],
                    controller: viewModel.state2,
                  ),
                  NumberBox(
                    focusnode: focusnode[2],
                    nextNode: focusnode[3],
                    controller: viewModel.state3,
                  ),
                  NumberBox(
                    focusnode: focusnode[3],
                    nextNode: focusnode[4],
                    controller: viewModel.state4,
                  ),
                  NumberBox(
                    focusnode: focusnode[4],
                    nextNode: focusnode[5],
                    controller: viewModel.state5,
                  ),
                  NumberBox(
                    focusnode: focusnode[5],
                    controller: viewModel.state6,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Center(
          child: Text(
            textAlign: TextAlign.center,
            'ระบบได้ส่งรหัสไปที่เบอร์โทรศัพท์ดังกล่าวแล้ว\nโปรดใส่รหัสที่คุณได้รับ เพื่อเสร็จสิ้นขั้นตอนการยืนยันความปลอดภัย',
            style: TextStyle(fontSize: 12, color: ColorPalette.grey),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'รับรหัสอีกครั้ง',
                style: TextStyle(
                    fontSize: 14,
                    color: ColorPalette.redglag,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorPalette.redglag),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                IconData(
                  0xf00e9,
                  fontFamily: 'MaterialIcons',
                ),
                color: ColorPalette.redglag,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AuthButton(
              fn: () {
                print(
                  viewModel.state1.text +
                      viewModel.state2.text +
                      viewModel.state3.text +
                      viewModel.state4.text +
                      viewModel.state5.text +
                      viewModel.state6.text,
                );
              },
              title: 'ยืนยันความปลอดภัย',
              color: ColorPalette.greenBtn,
              titleColor: ColorPalette.white,
              borderColor: ColorPalette.greenBtn),
        )
      ],
    );
  }
}
