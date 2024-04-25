import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';

class NumberBox extends StatelessWidget {
  final Color spaceColor;
  final TextEditingController? controller;
  final Color succColor;
  final Color errColor;
  final FocusNode focusnode;
  final FocusNode? nextNode;
  final FocusNode? prevNode;
  // final Widget? numericOpt;
  final bool isTypeOpt;
  final Text? opt;
  const NumberBox({
    super.key,
    this.spaceColor = ColorPalette.white,
    this.succColor = ColorPalette.greenBtn,
    this.errColor = ColorPalette.redglag,
    this.controller,
    required this.focusnode,
    this.nextNode,
    this.prevNode,

    // this.numericOpt = const Image(
    //   image: AssetImage('assets/X.png'),
    //   color: ColorPalette.blacke45,
    //   width: 10,
    // ),
    this.isTypeOpt = false,
    this.opt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: spaceColor,
          border: Border.all(color: ColorPalette.blacke45)),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFormField(
          focusNode: focusnode,
          maxLength: 1,
          controller: controller,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
              hintText: 'X',
              hintStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorPalette.grey),
              counterText: ''),
          onChanged: (val) {
            if (val.length == 1 && nextNode != null) {
              FocusScope.of(context).requestFocus(nextNode);
            }
          },
        ),
      ),
    );
  }
}
