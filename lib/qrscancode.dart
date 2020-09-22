import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:qr_scan_code/configs/logger.dart';

class QrCodeScan extends StatefulWidget {
  @override
  _QrCodeScanState createState() => _QrCodeScanState();
}

class _QrCodeScanState extends State<QrCodeScan> {
  Logger log = getLogger("QrCodeScan".obs);
  RxString result = "کد بارکد".obs;
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      log.i(qrResult);
      setState(() {
        result = qrResult as RxString;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission denied" as RxString;
        });
      } else {
        setState(() {
          result = "Unkown error $ex" as RxString;
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything" as RxString;
      });
    }catch(e){
      setState(() {
          result = "Unkown error $e" as RxString;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanQR,
        label: Text("اسکن"),
        icon: Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("اسکنر بارکد"),
      ),
      body: Center(
          child: Text(
        "${result}",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
