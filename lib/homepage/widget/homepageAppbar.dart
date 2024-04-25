import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/homepage/widget/circlewithicon.dart';

class HomePageeAppbar extends StatelessWidget {
  const HomePageeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          top: MediaQuery.sizeOf(context).height * 0.03,
          right: MediaQuery.of(context).size.width * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleIcon(
                width: MediaQuery.sizeOf(context).width * 0.06,
                height: MediaQuery.sizeOf(context).width * 0.06,
                color: ColorPalette.blacke45,
                child: Icon(
                  Icons.phone,
                  color: ColorPalette.white,
                  size: MediaQuery.sizeOf(context).width * 0.04,
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.025),
              CircleIcon(
                width: MediaQuery.sizeOf(context).width * 0.06,
                height: MediaQuery.sizeOf(context).width * 0.06,
                color: ColorPalette.blacke45,
                child: Icon(
                  Icons.people,
                  color: ColorPalette.white,
                  size: MediaQuery.sizeOf(context).width * 0.04,
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.025),
              CircleIcon(
                width: MediaQuery.sizeOf(context).width * 0.06,
                height: MediaQuery.sizeOf(context).width * 0.06,
                color: ColorPalette.blacke45,
                child: Icon(
                  Icons.arrow_right_alt,
                  color: ColorPalette.white,
                  size: MediaQuery.sizeOf(context).width * 0.04,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).width * 0.05,
          left: 40,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'เลขที่ห้อง',
                        style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).width * 0.05,
                            fontFamily: 'kanit',
                            color: ColorPalette.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ชื่อหมู่บ้านคอนโด',
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * 0.02,
                          fontFamily: 'kanit',
                          color: ColorPalette.white),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Image(
                    image: AssetImage('assets/whiteline.png'),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20),
                      child: Text(
                        '1/8 ตึกB\nถนนxxxxxxxxx\nแขวง xxxxxx เขต xxxxx\nจังหวัด รหัสไปรษณีย์',
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'kanit',
                            color: ColorPalette.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
