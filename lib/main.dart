import 'package:flutter/material.dart';
import 'package:qrcodescanner/MainScreen.dart';
import 'package:qrcodescanner/QRCodeGenerator.dart';
import 'package:qrcodescanner/QRCodeScanner.dart';

void main() {
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
       MainScreen.idScreen: (context) => MainScreen(),
     },

     debugShowCheckedModeBanner: false,
    );
  }
}
