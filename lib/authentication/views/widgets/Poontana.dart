import 'package:flutter/material.dart';

class PoontanaHeader extends StatelessWidget {
  const PoontanaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Image(
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height * 0.04,
        image: const AssetImage('assets/logo.png'),
      ),
    );
  }
}
