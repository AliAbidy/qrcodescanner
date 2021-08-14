import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrcodescanner/MainScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class BarCodeScanner extends State<BarCodeScannerWidget> {
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("QR Code Generator"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(MainScreen.idScreen);
          },
        ),
      ),

      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.black
                ),
                onPressed: _buildBarCodeView, label: Text("Scan"), icon: Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (scanResult != null && scanResult != "-1") ?  "Result : ${scanResult}" : "Scan a code",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.black
            ),
            onPressed: (()
            {
              if(this.scanResult != null) {
                _launchURL("https://www.google.com/search?q="+this.scanResult!.replaceAll(" ", "+"), this.scanResult);
              }
            }
            ), icon: Icon(Icons.open_in_browser), label: Text("Open In Browser"),
          )
        ],
      ),
    );
  }

 Future _buildBarCodeView() async {
    String scanResult;
    try {

      scanResult = await FlutterBarcodeScanner.scanBarcode("#ff6666","Cancel", false, ScanMode.BARCODE);

    } on PlatformException {
      scanResult = "Failed to get platform version.";
    }

    if(!mounted) {
      return;
    }

    setState(() {
      this.scanResult = scanResult;
    });
  }

  void _launchURL(String google_url, _url) async =>
      await canLaunch(_url) ? await launch(_url) : launch(google_url);

}


class BarCodeScannerWidget extends StatefulWidget {
  static const String idScreen = "BarCodeScannerWidget";
  @override
  State<StatefulWidget> createState() => BarCodeScanner();
}