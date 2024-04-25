import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderWithTitle extends StatelessWidget {
  final String header;
  final String titleText;
  const HeaderWithTitle(
      {super.key, required this.header, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * 0.06,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit'),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          RichText(
              text: TextSpan(
                  text: titleText,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                      fontFamily: 'Kanit')))
        ],
      ),
    );
  }
}
