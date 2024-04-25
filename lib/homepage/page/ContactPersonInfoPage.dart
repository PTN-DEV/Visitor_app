import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:visitor/authentication/view_model/db_provider.dart';
import 'package:visitor/authentication/views/widgets/AddButton.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/core/utils/fontStyleUtils.dart';
import 'package:visitor/homepage/page/ContactLogPage.dart';
import 'package:visitor/homepage/view-model/scanqrProvider.dart';
import 'package:visitor/homepage/widget/circlewithicon.dart';
import 'package:visitor/homepage/widget/contactlist.dart';
import 'package:visitor/homepage/widget/greenBtn.dart';
import 'package:visitor/homepage/widget/homepageAppbar.dart';

class ContactInfoPage extends StatelessWidget {
  // final String qrCode;
  ContactInfoPage({Key? key}) : super(key: key);
  // required this.qrCode,
  FontStyleUtils fontStyleUtils = FontStyleUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ScanQrProvider(),
        builder: (context, _) => Consumer<ScanQrProvider>(
          builder: (context, qrProvider, _) => Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.sizeOf(context).height * 0.25,
                color: ColorPalette.greenBtn,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.2), // ปรับค่า opacity ตรงนี้
                        BlendMode.dstATop,
                      ),
                      child: Positioned.fill(
                        child: Image.asset(
                          'assets/homeAppbar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      height: MediaQuery.sizeOf(context).height * 0.15,
                      left: MediaQuery.of(context).size.width * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleIcon(
                            width: MediaQuery.sizeOf(context).width * 0.07,
                            height: MediaQuery.sizeOf(context).width * 0.07,
                            color: ColorPalette.blacke45,
                            child: Icon(
                              Icons.arrow_left_outlined,
                              color: ColorPalette.white,
                              size: MediaQuery.sizeOf(context).height * 0.03,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Text(
                            'รายชื่อผู้ติดต่อ',
                            style: TextStyle(
                              fontFamily: 'kanit',
                              color: ColorPalette.white,
                              fontSize:
                                  MediaQuery.sizeOf(context).height * 0.025,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.03,
                        left: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'หมายเลขผู้ติดต่อ',
                                style: TextStyle(
                                    fontFamily: 'kanit',
                                    color: ColorPalette.white,
                                    fontSize: MediaQuery.sizeOf(context).width *
                                        0.025),
                              ),
                              Text(
                                'VM-0001',
                                style: TextStyle(
                                    fontFamily: 'kanit',
                                    color: ColorPalette.white,
                                    fontSize: MediaQuery.sizeOf(context).width *
                                        0.05),
                              ),
                              Text(
                                '${qrProvider.qrData}',
                                style: TextStyle(
                                    fontFamily: 'kanit',
                                    color: ColorPalette.white,
                                    fontSize: MediaQuery.sizeOf(context).width *
                                        0.025),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.sizeOf(context).width * 0.05,
                    right: MediaQuery.sizeOf(context).width * 0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPalette.white,
                      boxShadow: const [
                        BoxShadow(
                            color: ColorPalette.blacke45,
                            spreadRadius: 0.5,
                            blurRadius: 7,
                            offset: Offset(0, 4)),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.sizeOf(context).width * 0.05,
                            right: MediaQuery.sizeOf(context).width * 0.05),
                        child: CircleIcon(
                          width: MediaQuery.sizeOf(context).width * 0.07,
                          height: MediaQuery.sizeOf(context).width * 0.07,
                          color: ColorPalette.orangebtn,
                          child: Icon(
                            IconData(0xf655,
                                fontFamily: CupertinoIcons.iconFont,
                                fontPackage: CupertinoIcons.iconFontPackage),
                            color: ColorPalette.white,
                            size: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'คุณค้องการประทับตราสำหรับผู้ติดต่อ ?',
                            style: TextStyle(
                                fontFamily: 'kanit',
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'กรุณากด ยืนยันการประทับตรา',
                            style: TextStyle(
                                fontFamily: 'kanit',
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.02,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.05,
                    right: MediaQuery.sizeOf(context).width * 0.05),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  // height: MediaQuery.sizeOf(context).height * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPalette.white,
                      boxShadow: const [
                        BoxShadow(
                            color: ColorPalette.blacke45,
                            spreadRadius: 0.5,
                            blurRadius: 7,
                            offset: Offset(0, 4)),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'หมายเลขผุ้ติดต่อ',
                                    style: fontStyleUtils.getHeaderTextStyle(
                                        MediaQuery.sizeOf(context).width *
                                            0.02),
                                  ),
                                  Text('VM-0001',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.05)),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: ColorPalette.greenBtn
                                            .withOpacity(0.5)),
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.3,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.025,
                                    child: Text('รายละเอียดผู้ติดต่อ',
                                        style:
                                            fontStyleUtils.getHeaderTextStyle(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.025)),
                                  )
                                ],
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.15,
                                  child: const Image(
                                    image: AssetImage('assets/qrcode.png'),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('ผู้ติดต่อ',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.02)),
                                  Text('ชื่อขนามสกุลผู้ติดต่อ',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.05)),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('สถานที่'),
                                  Text(('เลขที่ห้อง')),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('ผู้ติดต่อ',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.02)),
                                  Text('ชื่อขนามสกุลผู้ติดต่อ',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.05)),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('สถานที่'),
                                  Text(('เลขที่ห้อง')),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('วันที่ลงเวลาเข้า',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.02)),
                                  Text('19//04/2024',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.05)),
                                  Text('วันที่ลงเวลาออก',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.02)),
                                  Text(
                                    ('-'),
                                    style:
                                        fontStyleUtils.getHeaderTextStyle(20),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('การลงเวลาเข้า',
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.02)),
                                  Text(('17:48:06'),
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.05)),
                                  Text(('การลงเวลาออก'),
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.02)),
                                  Text(('-'),
                                      style: fontStyleUtils.getHeaderTextStyle(
                                          MediaQuery.sizeOf(context).width *
                                              0.02)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                        ),
                        GreenBtn(
                            fn: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: ColorPalette.white,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: ColorPalette.white),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: ColorPalette.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleIcon(
                                            color: ColorPalette.orangebtn,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            child: Icon(
                                              size: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.05,
                                              const IconData(0xf655,
                                                  fontFamily:
                                                      CupertinoIcons.iconFont,
                                                  fontPackage: CupertinoIcons
                                                      .iconFontPackage),
                                              color: ColorPalette.white,
                                            ),
                                          ),
                                          Text(
                                            'คุณต้องการประทับตราสำหรับผู้ติดต่อ ?',
                                            style: fontStyleUtils
                                                .getHeaderTextStyle(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.035),
                                          ),
                                          Text(
                                            'กรุณาตรวจสอบข้อมูลแล้วกด ตกลง เพื่อประทับตรา ?',
                                            style: fontStyleUtils
                                                .getHeaderTextStyle(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.02),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GreenBtn(
                                                title: 'ยกเลิก',
                                                color: ColorPalette.white,
                                                titleColor:
                                                    ColorPalette.blacke45,
                                                borderColor:
                                                    ColorPalette.blacke45,
                                                btnW: MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.3,
                                              ),
                                              GreenBtn(
                                                fn: () {
                                                  Navigator.push(context,
                                                      ContactLogPage.route());
                                                },
                                                title: 'ตกลง',
                                                color: ColorPalette.orangebtn,
                                                titleColor: ColorPalette.white,
                                                borderColor:
                                                    ColorPalette.orangebtn,
                                                btnW: MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.3,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            title: 'ยืนยันการประทับตรา',
                            color: ColorPalette.greenBtn,
                            titleColor: ColorPalette.white,
                            borderColor: ColorPalette.greenBtn),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
