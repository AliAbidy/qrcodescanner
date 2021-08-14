import 'package:flutter/material.dart';
import 'package:qrcodescanner/BarCodeGenerator.dart';
import 'package:qrcodescanner/BarCodeScanner.dart';
import 'package:qrcodescanner/MainScreen.dart';
import 'package:qrcodescanner/QRCodeGenerator.dart';
import 'package:qrcodescanner/QRCodeScanner.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: MainScreen.idScreen,
     routes: {
       QRGeneratorWidget.idScreen: (context) => QRGeneratorWidget(),
       QRViewWidget.idScreen: (context) => QRViewWidget(),
       BarCodeGeneratorWidget.idScreen: (context) => BarCodeGeneratorWidget(),
       BarCodeScannerWidget.idScreen: (context) => BarCodeScannerWidget(),
       MainScreen.idScreen: (context) => MainScreen(),
     },

     debugShowCheckedModeBanner: false,
    );
  }
}
