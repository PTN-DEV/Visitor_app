import 'package:flutter/material.dart';
import 'package:visitor/authentication/views/widgets/Poontana.dart';
import 'package:visitor/core/utils/color_palette.dart';

class PoontanaHeaderWithBtn extends StatelessWidget {
  const PoontanaHeaderWithBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: ColorPalette.greenBtn),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: ColorPalette.greenBtn,
                ),
              )),
          const PoontanaHeader(),
        ],
      ),
    );
  }
}
