import 'dart:ffi';

import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final Color? color;
  const CircleIcon(
      {super.key,
      required this.width,
      required this.height,
      this.child,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), color: color),
      child: child,
    );
  }
}
