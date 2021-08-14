import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescanner/BarCodeGenerator.dart';
import 'package:qrcodescanner/BarCodeScanner.dart';
import 'package:qrcodescanner/QRCodeGenerator.dart';
import 'package:qrcodescanner/QRCodeScanner.dart';

class MainScreen extends StatelessWidget {

  static const String idScreen = "MainScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "QR & Bar Code App",
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => exit(0),
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: 25,),
              SizedBox.fromSize(
                size: Size(150, 150), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.grey, // button color
                    child: InkWell(
                      splashColor: Colors.green, // splash color
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, QRViewWidget.idScreen, (route) => false);
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.qr_code_scanner), // icon
                          Text("QR Code Scanner"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30,),
              SizedBox.fromSize(
                size: Size(150, 150), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.grey, // button color
                    child: InkWell(
                      splashColor: Colors.green, // splash color
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, QRGeneratorWidget.idScreen, (route) => false);
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.qr_code), // icon
                          Text("QR Code Generator"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 40,),
          Row(
            children: [
              SizedBox(width: 25,),
              SizedBox(height: 40,),
              SizedBox.fromSize(
                size: Size(150, 150), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.grey, // button color
                    child: InkWell(
                      splashColor: Colors.green, // splash color
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, BarCodeScannerWidget.idScreen, (route) => false);
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.bar_chart), // icon
                          Text("Barcode Scanner"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30,),
              SizedBox.fromSize(
                size: Size(150, 150), // button width and height
                child: ClipOval(
                  child: Material(
                    color: Colors.grey, // button color
                    child: InkWell(
                      splashColor: Colors.green, // splash color
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, BarCodeGeneratorWidget.idScreen, (route) => false);
                      }, // button pressed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.bar_chart_outlined), // icon
                          Text("Barcode Generator"), // text
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}