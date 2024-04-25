import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';

class AddButton extends StatelessWidget {
  final double btnwidth;
  final double btnheight;
  final Color btnColor;
  final Icon btnIcon;

  const AddButton(
      {super.key,
      this.btnwidth = 350,
      this.btnheight = 45,
      this.btnColor = ColorPalette.greenBtn,
      this.btnIcon = const Icon(
        Icons.add,
        color: ColorPalette.greenBtn,
      )});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: btnwidth.toDouble(),
        height: btnheight.toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: btnColor,
        ),
        child: Center(
          child: btnIcon,
        ),
      ),
    );
  }
}
