import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visitor/core/utils/color_palette.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color color;
  final Color borderColor;
  final Widget? logoLeft;
  final Widget? logoRight;
  final double btnWidth;
  final double btnHeight;
  final void Function()? fn;
  const AuthButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.titleColor,
      required this.borderColor,
      this.logoLeft,
      this.logoRight,
      this.btnHeight = 45,
      this.btnWidth = 350,
      this.fn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: Center(
        child: Container(
          height: btnHeight,
          width: btnWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: color,
              border: Border.all(color: borderColor)),
          child: Stack(children: [
            if (logoLeft != null)
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: logoLeft,
                  ),
                ),
              ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(color: titleColor, fontFamily: 'Kanit'),
                ))
          ]),
        ),
      ),
    );
  }
}
