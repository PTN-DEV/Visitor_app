import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor/authentication/view_model/Auth_view_model.dart';
import 'package:visitor/core/utils/base/baseScree.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/homepage/page/announcePage.dart';
import 'package:visitor/homepage/page/homePage.dart';
import 'package:visitor/homepage/page/notificationPage.dart';

import 'package:visitor/homepage/page/scanPage.dart';
import 'package:visitor/homepage/page/userSettingPage.dart';

class MainHomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const MainHomePage(),
      );
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  Color notchColor = ColorPalette.greenBtn;
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomePage(),
    const NotificationPage(),
    const ScanPage(),
    const AnnouncePage(),
    const UserSettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        viewmodel: AuthViewModel(context: context),
        builder: (context, viewmodel, child, deviceScreen) {
          return _mainContent(context, viewmodel);
        });
  }

  Widget _mainContent(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              itemLabelStyle: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width * 0.03,
                  color: ColorPalette.greenBtn,
                  fontFamily: 'kanit'),

              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: ColorPalette.white,
              showLabel: true,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: 3.14 / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),

              notchColor: notchColor,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: MediaQuery.of(context).size.width,
              bottomBarHeight: MediaQuery.sizeOf(context).height * 0.05,

              showShadow: false,
              durationInMilliSeconds: 100,
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_outlined,
                    color: ColorPalette.greenBtn,
                  ),
                  activeItem: Icon(
                    Icons.home_outlined,
                    color: ColorPalette.white,
                  ),
                  itemLabel: 'หน้าหลัก',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.announcement_outlined,
                    color: ColorPalette.greenBtn,
                  ),
                  activeItem: Icon(
                    Icons.announcement_outlined,
                    color: ColorPalette.white,
                  ),
                  itemLabel: 'ประกาศ',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.qr_code_scanner_outlined,
                    color: ColorPalette.greenBtn,
                  ),
                  activeItem: Icon(
                    Icons.qr_code_scanner_outlined,
                    color: ColorPalette.white,
                  ),
                  itemLabel: 'แสกน',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.ring_volume,
                    color: ColorPalette.greenBtn,
                  ),
                  activeItem: Icon(
                    Icons.ring_volume,
                    color: ColorPalette.white,
                  ),
                  itemLabel: 'แจ้งเตือน',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: ColorPalette.greenBtn,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: ColorPalette.white,
                  ),
                  itemLabel: 'ผู้ใช้งาน',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
                if (index == 2) {
                  setState(() {
                    notchColor = ColorPalette.orangebtn;
                  });
                } else {
                  setState(() {
                    notchColor = ColorPalette.greenBtn;
                  });
                }
              },
              kIconSize: MediaQuery.sizeOf(context).width * 0.05,
            )
          : null,
    );
  }
}
