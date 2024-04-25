import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:visitor/authentication/view_model/db_provider.dart';
import 'package:visitor/core/utils/color_palette.dart';
import 'package:visitor/homepage/page/ContactPersonInfoPage.dart';
import 'package:visitor/homepage/view-model/scanqrProvider.dart';

class ScanPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ScanPage(),
      );
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  DatabaseProvider dbProvider = DatabaseProvider();
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() async {
    await dbProvider.getToken();
    await dbProvider.getUserId();
    // ทำสิ่งที่ต้องการหลังจากได้ค่า Token และ UserId จาก DatabaseProvider
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    // Listen to changes in result when build method is called

    return Scaffold(
      backgroundColor: ColorPalette.grey,
      body: ChangeNotifierProvider(
        create: (context) => ScanQrProvider(),
        builder: (context, _) => Consumer<ScanQrProvider>(
          builder: (context, qrProvider, _) => Stack(
            fit: StackFit.expand,
            children: [
              Expanded(child: _buildQrView(context, qrProvider)),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          await qrProvider.controller?.toggleFlash();
                          qrProvider.isFlashSelected =
                              !qrProvider.isFlashSelected;
                        },
                        child: FutureBuilder(
                          future: qrProvider.controller?.getFlashStatus(),
                          builder: (context, snapshot) {
                            return CircleAvatar(
                              backgroundColor: qrProvider.isFlashSelected
                                  ? ColorPalette.orangebtn
                                  : ColorPalette.greenold,
                              child: const Icon(
                                Icons.flash_off,
                                color: ColorPalette.white,
                              ),
                            );
                          },
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: ColorPalette.greenold,
                        child: Icon(Icons.browse_gallery_outlined,
                            color: ColorPalette.white),
                      ),
                      InkWell(
                        onTap: () async {
                          await qrProvider.controller?.flipCamera();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: qrProvider.controller?.getCameraInfo(),
                          builder: (context, snapshot) {
                            return const CircleAvatar(
                              backgroundColor: ColorPalette.greenold,
                              child: Icon(Icons.camera_alt_outlined,
                                  color: ColorPalette.white),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.6,
                left: MediaQuery.sizeOf(context).width * 0.05,
                child: (qrProvider.result != null)
                    ? Center(
                        child: Text('  Data: ${qrProvider.result!.code}'),
                      )
                    : Center(
                        child:
                            Text('กรุณาวางตำแหน่งของ QR Code ให้อยู่ในกรอบ')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context, ScanQrProvider qrProvider) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrProvider.qrKey,
      onQRViewCreated: (controller) =>
          qrProvider.setController(context, controller),
      overlay: QrScannerOverlayShape(
          borderColor: ColorPalette.orangebtn,
          borderRadius: 3,
          borderLength: 30,
          borderWidth: 3,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) =>
          qrProvider.onPermissionSet(context, ctrl, p),
    );
  }
}
