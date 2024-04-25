import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';

class Container70 extends StatelessWidget {
  final String headTitle;
  final String subjectTitle;
  final IconData? iconRaw;
  const Container70({
    super.key,
    required this.headTitle,
    required this.subjectTitle,
    this.iconRaw = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorPalette.white,
          boxShadow: const [
            BoxShadow(
                color: ColorPalette.blacke45,
                spreadRadius: 0.5,
                blurRadius: 7,
                offset: Offset(0, 4)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              iconRaw,
              color: ColorPalette.greenBtn,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  headTitle,
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.015,
                      fontFamily: 'kanit',
                      color: ColorPalette.greenBtn),
                ),
                Text(
                  subjectTitle,
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.008,
                      fontFamily: 'kanit',
                      color: ColorPalette.greenBtn),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
