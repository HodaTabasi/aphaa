import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../get/change_name_getx_controller.dart';

class  ReadPdf extends StatefulWidget {
  static String routeName = "/read_pdf";

  @override
  State<ReadPdf> createState() => _State();
}

class _State extends State<ReadPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SfPdfViewer.file(File(ChangeGetxController.to.filePath)),
      ),
    );
  }
}
