import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodescanner/MainScreen.dart';

class QRCodeGenerator extends State<QRGeneratorWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context)  => Scaffold(
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
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: controller.text,
              size: 200,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 40,
            ),
            buildTextField(context),
          ],
        ),
      ),
    ),
  );

  Widget buildTextField(BuildContext context) => TextFormField (
    controller: controller,

    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20
    ),



    decoration: InputDecoration (
      enabledBorder: OutlineInputBorder (
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide (
            color: Colors.white,
          ),
      ),
      focusedBorder: OutlineInputBorder (
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide (
          color: Theme.of(context).accentColor,
        )
      ),

      suffixIcon: IconButton (
        enableFeedback: true,
        icon: Icon(
          Icons.done,
          size : 30,
        ),
        onPressed: () => setState(() {

        }),
      )

    ),
  );

}

class QRGeneratorWidget extends StatefulWidget {
  static const String idScreen = "QRGeneratorWidget";
  @override
  State<StatefulWidget> createState() => QRCodeGenerator();
}