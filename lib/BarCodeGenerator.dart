import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescanner/MainScreen.dart';

class BarCodeGenerator extends State<BarCodeGeneratorWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context)  => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text("Bar Code Generator"),
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
            Card (
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: controller.text,
                  backgroundColor: Colors.white,
                  width: 200,
                  height: 200,
                ),
              ),
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

class BarCodeGeneratorWidget extends StatefulWidget {
  static const String idScreen = "BarCodeGeneratorWidget";
  @override
  State<StatefulWidget> createState() => BarCodeGenerator();
}