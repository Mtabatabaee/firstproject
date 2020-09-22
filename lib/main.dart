import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scan_code/screens/qrscancode.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter QR scaner',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: QrCodeScan(),
    );
  }
}
