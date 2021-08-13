import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcodescanner/MainScreen.dart';

class QRCodeScanner extends State<QRViewWidget> {
  QRViewController? controller;
  final qrKey = GlobalKey(debugLabel: "QR");
  Barcode? barcode;


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("QR Code Generator"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(MainScreen.idScreen);
          },
        ),
      ),

      body: Stack (
        alignment: Alignment.center,
        children: <Widget> [
          _buildQrView(context),
          Positioned(
            bottom: 10,
            child: buildResult(),
          )
        ],

      ),
    );
  }

  Widget buildResult() => Text(
    barcode != null ?  "Result : ${barcode!.code}" : "Scan a code",
    maxLines: 3,
    style: TextStyle(
      backgroundColor: Colors.transparent,
      color: Colors.grey,
    ),
  );

  Widget _buildQrView(BuildContext context) {
    return QRView (
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 20,
          cutOutSize: MediaQuery.of(context).size.width * 0.8),
      onPermissionSet: (ctrl, p) => onPermissionSet(context, ctrl, p),
    );
  }
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) => setState(() => this.barcode = barcode));
  }

  onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {

  }


}

class QRViewWidget extends StatefulWidget {
  static const String idScreen = "QRViewWidget";
  @override
  State<StatefulWidget> createState() => QRCodeScanner();
}