import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/core/utils/fontStyleUtils.dart';
import 'package:visitor/homepage/widget/circlewithicon.dart';
import 'package:visitor/homepage/widget/contactlist.dart';

class ContactLogPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => ContactLogPage(),
      );
  ContactLogPage({super.key});
  FontStyleUtils fontStyleUtils = FontStyleUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          color: ColorPalette.greenBtn,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2), // ปรับค่า opacity ตรงนี้
                  BlendMode.dstATop,
                ),
                child: Positioned.fill(
                  child: Image.asset(
                    'assets/homeAppbar.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                height: 150,
                left: MediaQuery.of(context).size.width * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleIcon(
                      width: 30,
                      height: 30,
                      color: ColorPalette.blacke45,
                      child: Icon(
                        Icons.arrow_left_outlined,
                        color: ColorPalette.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    const Text(
                      'ประวัติผู้ติดต่อ',
                      style: TextStyle(
                          fontFamily: 'kanit',
                          color: ColorPalette.white,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.4,
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorPalette.white,
                    border: Border.all(color: ColorPalette.blacke45)),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.4,
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorPalette.white,
                    border: Border.all(color: ColorPalette.blacke45)),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.05,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: ColorPalette.white,
                  border: Border.all(color: ColorPalette.blacke45)),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.1,
              height: MediaQuery.sizeOf(context).height * 0.05,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: ColorPalette.greenBtn),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.05,
            right: MediaQuery.sizeOf(context).width * 0.05,
            top: MediaQuery.sizeOf(context).height * 0.03,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'รายการผู้ติดต่อทั้งหมด',
              style: fontStyleUtils
                  .getHeaderTextStyle(MediaQuery.sizeOf(context).width * 0.02),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.05,
            right: MediaQuery.sizeOf(context).width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              const ContactList(
                boxColor: ColorPalette.white,
                contactName: 'พันธนา',
                contactNum: 'VM-0001',
                plateNumber: '1กย1167',
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
