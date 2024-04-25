import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';

class Container100 extends StatelessWidget {
  final String headTitle;
  final String subjectTitle;
  final IconData? iconRaw;
  const Container100({
    super.key,
    required this.headTitle,
    required this.subjectTitle,
    this.iconRaw = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.sizeOf(context).height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorPalette.greenBtn,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: iconRaw != null
              ? [
                  Icon(
                    iconRaw,
                    color: ColorPalette.white,
                  ),
                  Text(
                    headTitle,
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        fontFamily: 'kanit',
                        color: ColorPalette.white),
                  ),
                  Text(
                    subjectTitle,
                    style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * 0.01,
                        fontFamily: 'kanit',
                        color: ColorPalette.white),
                  )
                ]
              : [Text(headTitle), Text(subjectTitle)],
        ),
      ),
    );
  }
}
