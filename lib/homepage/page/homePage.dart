import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/homepage/widget/circlewithicon.dart';
import 'package:visitor/homepage/widget/container100px.dart';
import 'package:visitor/homepage/widget/container70px.dart';
import 'package:visitor/homepage/widget/homepageAppbar.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {
  bool isServiceIconPressed = true;
  bool isMessageIconPressed = false;
  bool isUtilIconPressed = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      backgroundColor: ColorPalette.whitegrey,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.sizeOf(context).height * 0.25,
            color: ColorPalette.greenBtn,
            child: const HomePageeAppbar(),
          ),
          Padding(
            padding: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * 0.015,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.sizeOf(context).height * 0.1,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.markunread_mailbox_outlined,
                    color: ColorPalette.greenBtn,
                  ),
                  Image(
                    image: AssetImage('assets/whiteline.png'),
                    color: ColorPalette.grey,
                  ),
                  Icon(
                    Icons.fire_truck_outlined,
                    color: ColorPalette.greenBtn,
                  ),
                  Image(
                    image: AssetImage('assets/whiteline.png'),
                    color: ColorPalette.grey,
                  ),
                  Icon(
                    Icons.people_alt_outlined,
                    color: ColorPalette.greenBtn,
                  ),
                  Image(
                    image: AssetImage('assets/whiteline.png'),
                    color: ColorPalette.grey,
                  ),
                  Icon(
                    Icons.account_box_outlined,
                    color: ColorPalette.greenBtn,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.03,
              left: MediaQuery.sizeOf(context).height * 0.05,
              right: MediaQuery.sizeOf(context).height * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isServiceIconPressed = true;
                      isMessageIconPressed = false;
                      isUtilIconPressed = false;
                    });
                  },
                  child: Icon(
                    Icons.report_problem_outlined,
                    color: isServiceIconPressed ? Colors.green : Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isServiceIconPressed = false;
                      isMessageIconPressed = true;
                      isUtilIconPressed = false;
                    });
                  },
                  child: Icon(
                    Icons.message_outlined,
                    color: isMessageIconPressed ? Colors.green : Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isServiceIconPressed = false;
                      isMessageIconPressed = false;
                      isUtilIconPressed = true;
                    });
                  },
                  child: Icon(
                    Icons.grading_outlined,
                    color: isUtilIconPressed ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          isServiceIconPressed
              ? Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Container100(
                              headTitle: 'ค่าใช่จ่าย',
                              subjectTitle: 'การดำเนินการค่าใช้จ่ายคงค้าง'),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.02,
                          ),
                          const Container70(
                              headTitle: 'ประวัติค่าใช้จ่าย',
                              subjectTitle: 'รายการค่าใช้จ่ายทั้งหมด')
                        ],
                      ),
                      Column(
                        children: [
                          const Container70(
                              headTitle: 'จองส่วนกลาง',
                              subjectTitle: 'การจองพื้นที่ส่วนกลาง'),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.02,
                          ),
                          const Container100(
                              headTitle: 'ประวัติผู้ติดต่อ',
                              subjectTitle: 'รายการผู้ติดต่อทั้งหมด')
                        ],
                      )
                    ],
                  ),
                )
              : isMessageIconPressed
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.03,
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Container100(
                                    headTitle: 'แชทกับนิติ',
                                    subjectTitle:
                                        'การสอบถามรายละเอียดเพิ่มเติม'),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.05,
                                ),
                                const Container70(
                                    headTitle: 'โทรหานิติ',
                                    subjectTitle: 'โทรศัพเพื่อติดต่อนิติ'),
                              ],
                            ),
                            Column(
                              children: [
                                const Container70(
                                    headTitle: 'แจ้งซ่อม',
                                    subjectTitle: 'การติดต่อซ่อมบำรุง'),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.05,
                                ),
                                const Container100(
                                    headTitle: 'แจ้งกู้ภัย',
                                    subjectTitle:
                                        'แจ้งเหตุด่วนเหตุร้าย ติดต่อกู้ภัย'),
                              ],
                            )
                          ]),
                    )
                  : isUtilIconPressed
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.03,
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Container100(
                                      headTitle: 'สิทธิพิเศษ',
                                      subjectTitle:
                                          'รายการสิทธิพิเศษต่างๆ สำหรับคุณ'),
                                  SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.03,
                                  ),
                                  const Container70(
                                      headTitle: 'รายละเอียดชุมชน',
                                      subjectTitle: 'รายละเอียดข้อบังคับชุมชน')
                                ],
                              ),
                              Column(
                                children: [
                                  const Container70(
                                      headTitle: 'ข้อมูลนิติ',
                                      subjectTitle: 'รายอะเอียดเกี่ยวนิติ'),
                                  SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.05,
                                  ),
                                  const Container100(
                                      headTitle: 'ห้องของฉัน',
                                      subjectTitle:
                                          'รายละเอียดเพิ่มเติมเกียวกับห้อง'),
                                ],
                              )
                            ],
                          ),
                        )
                      : Container()
        ],
      ),
    );
  }
}
