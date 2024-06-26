import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';

class FileProcess {
  static bool isFolderCreated = false;
  static Directory? directory;

  static checkDocumentFolder() async {
    try {
      if (!isFolderCreated) {
        // directory = await getExternalStorageDirectory();
        directory = await getApplicationDocumentsDirectory();
        await directory!.exists().then((value) {
          if (value) directory!.create();
          isFolderCreated = true;
        });
      }
      print(directory!.path);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<File> downloadFile1(base64r,fileName) async {
    final base64str = base64r;
    Uint8List bytes = base64.decode(base64str);
    await checkDocumentFolder();
    String dir =
        directory!.path + "/" + fileName;
    File file = new File(dir);
    if (!file.existsSync()) file.create();
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future<File> downloadFile(base64r,fileName) async {
    final base64str = base64r;
    Uint8List bytes = base64.decode(base64str);
    await checkDocumentFolder();
    String dir =
        directory!.path + "/" + fileName;
    File file = new File(dir);
    if (!file.existsSync()){
      print("object");
      await file.create(recursive: true);
    }
    await file.writeAsBytes(bytes);
    return file;
  }
  static void openFile(String fileName) {
    String dir =
        directory!.path + "/${fileName}.pdf";
    OpenFilex.open(dir);
  }
}
