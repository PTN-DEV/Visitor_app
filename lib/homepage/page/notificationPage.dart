import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/homepage/widget/homepageAppbar.dart';

class NotificationPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const NotificationPage(),
      );
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            color: ColorPalette.greenBtn,
            child: const HomePageeAppbar(),
          ),
        ],
      ),
    );
  }
}
