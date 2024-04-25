import 'package:flutter/material.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/core/utils/fontStyleUtils.dart';

class ContactList extends StatelessWidget {
  final Color? boxColor;
  final String contactNum;
  final String contactName;
  final String plateNumber;

  const ContactList(
      {super.key,
      this.boxColor,
      required this.contactName,
      required this.contactNum,
      required this.plateNumber});

  @override
  Widget build(BuildContext context) {
    FontStyleUtils fontStyleUtils = FontStyleUtils();
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorPalette.white,
          boxShadow: const [
            BoxShadow(
                color: ColorPalette.greenBtn,
                spreadRadius: 0.5,
                blurRadius: 7,
                offset: Offset(0, 4)),
          ]),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.05,
            right: MediaQuery.sizeOf(context).width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'หมายเลขผู้ติดต่อ',
              style: fontStyleUtils.getHeaderTextStyle(20),
            ),
            Text(
              contactNum,
              style: fontStyleUtils.getHeaderTextStyle(20),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPalette.greenBtn.withOpacity(0.5),
                  ),
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  height: MediaQuery.sizeOf(context).height * 0.025,
                  child: Text(
                    'ประเภทผู้ติดต่อ',
                    style: fontStyleUtils.getHeaderTextStyle(20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorPalette.greenBtn,
                  ),
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: MediaQuery.sizeOf(context).height * 0.02,
                  child: Text(
                    'ประทับตราแล้ว',
                    style: fontStyleUtils.getHeaderTextStyle(20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.lock_clock),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                Text(
                  contactName,
                  style: fontStyleUtils.getHeaderTextStyle(20),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.lock_clock),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                Text(
                  contactNum,
                  style: fontStyleUtils.getHeaderTextStyle(20),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.lock_clock),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                Text(
                  'xx/xx/xxxx (xx:xx:xx - xx:xx:xx)',
                  style: fontStyleUtils.getHeaderTextStyle(20),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.lock_clock,
                  color: ColorPalette.greenBtn,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                Text(
                  'ประทับตรา ชื่อขนามสกุลผู้ประทับตรา',
                  style: fontStyleUtils.getHeaderTextStyle(20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
