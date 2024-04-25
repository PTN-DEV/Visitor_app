import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor/authentication/model/user_modelList.dart';
import 'package:visitor/authentication/services/base_url.dart';
import 'package:visitor/authentication/view_model/db_provider.dart';
import 'package:visitor/homepage/page/ContactPersonInfoPage.dart';
import 'package:http/http.dart' as http;

class ScanQrProvider extends ChangeNotifier {
  Barcode? _result;
  QRViewController? _controller;
  bool _isLoading = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'qr');
  bool _isFlashSelected = false;
  String? _qrData = 'งง';

  //get
  Barcode? get result => _result;
  QRViewController? get controller => _controller;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? get qrData => _qrData;
  set qrData(String? value) {
    _qrData = value;
    notifyListeners();
  }

  bool get isFlashSelected => _isFlashSelected;
  set isFlashSelected(bool value) {
    _isFlashSelected = value;
    notifyListeners();
  }

  // void setController(BuildContext context, QRViewController controller) {
  //   _controller = controller;
  //   _controller!.scannedDataStream.listen((scanData) async {
  //     _result = scanData;
  //     notifyListeners();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String userId = prefs.getString('id') ?? "";
  //     if (_result != null) {
  //       print(
  //           'DatabaseProvider.userId = ${userId}  _result!.code! = ${_result!.code!}');

  //       getQrData(id: userId, data: _result!.code!, context: context);
  //     }
  //   });
  // }

  Future<void> setController(
      BuildContext context, QRViewController controller) async {
    _controller = controller;
    _controller!.scannedDataStream.listen((scanData) async {
      _result = scanData;
      qrData = scanData.code;
      print('${qrData}  ::: ${_qrData}');
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('id') ?? "";
      if (_result != null && userId.isNotEmpty) {
        // Ensure userId is not empty
        print('DatabaseProvider.userId = $userId  _result!.code! = ${_qrData}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactInfoPage(),
          ),
        );
      }
    });
  }

  void disposeController() {
    _controller?.dispose();
    _controller = null;
    _result = null;
    notifyListeners();
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void getQrData({
    required String id,
    required String data,
    required BuildContext context,
  }) async {
    print("GET QR");
    isLoading = true;
    notifyListeners();

    String url = await BaseUrl.qrCodeNavigation +
        '/qrCodes/?qrCode/=' +
        data +
        '&id=' +
        id.toString();

    try {
      // ใช้ http.get เพื่อดึงข้อมูลจาก URL
      http.Response response = await http.get(Uri.parse(url));

      print('response');

      // ตรวจสอบสถานะของการเรียก http.get
      if (response.statusCode == 200) {
        // ดึงข้อมูลสำเร็จ
        String responseData = response.body;
        // ทำอะไรต่อไปขึ้นอยู่กับข้อมูลที่ได้รับ

        disposeController();
      } else {
        // ไม่สามารถดึงข้อมูลได้
        print('Failed to get data. Error code: ${response.statusCode}');
      }
    } catch (e) {
      // เกิดข้อผิดพลาดในการเรียก http.get
      print('Error: $e');
    }
  }

  //  void handleResult(Barcode result,BuildContext context) {
  //   // process the result
  //   _result = result;
  //   notifyListeners();

  //   // Navigate to another page if result is not null
  //   if (result != null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ContactInfoPage(data: result.code),
  //       ),
  //     );
  //   }
  // }
}
