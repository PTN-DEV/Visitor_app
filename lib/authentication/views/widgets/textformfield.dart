import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';

class TextFormFieldAuth extends StatefulWidget {
  final String hintText;
  final Color borderColor;
  final Color passBorderColor;
  final Color errorBorderColor;
  final double formWidth;
  final double formHeight;
  final Icon? sfIcon;
  final Icon? sfIconOff;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool obscureText;
  final String inputLabel;

  const TextFormFieldAuth({
    Key? key,
    required this.hintText,
    required this.inputLabel,
    this.controller,
    this.sfIcon,
    this.borderColor = ColorPalette.grey,
    this.passBorderColor = ColorPalette.greenBtn,
    this.errorBorderColor = ColorPalette.redglag,
    this.formHeight = 45,
    this.formWidth = 350,
    this.suffix,
    this.sfIconOff,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<TextFormFieldAuth> createState() => _TextFormFieldAuthState();
}

class _TextFormFieldAuthState extends State<TextFormFieldAuth> {
  bool isInvisible = true;
  double initHeight = 45;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.formWidth,
      height: widget.formHeight,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText: widget.obscureText,
        textAlign: TextAlign.start,
        onChanged: (_) {
          setState(() {}); // ปรับสถานะ State เมื่อมีการเปลี่ยนแปลงใน controller
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.inputLabel,
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: (widget.controller?.text) == ''
                  ? widget.errorBorderColor
                  : widget.passBorderColor,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor),
              borderRadius: BorderRadius.circular(7)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.errorBorderColor,
              ),
              borderRadius: BorderRadius.circular(7)),
          suffixIcon: widget.suffix,
        ),
      ),
    );
  }
}
