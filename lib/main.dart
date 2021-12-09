import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(home: ZipMaker()));
}

class ZipMaker extends StatefulWidget {
  const ZipMaker({Key? key}) : super(key: key);

  @override
  _ZipMakerState createState() => _ZipMakerState();
}

class _ZipMakerState extends State<ZipMaker> {
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  writeFile(String text) async {
    Directory? directory = await getExternalStorageDirectory();
    print(directory!.path);
    String dirPath = directory.path;
    final File createFile = File('$dirPath/demoTextFile.txt');
    String filePath = '$dirPath/demoTextFile.txt';
    await createFile.writeAsString(text);
  }

  readFile() async {
    Directory? directory = await getExternalStorageDirectory();
    String dirpath = directory!.path;
    File file = File('$dirpath/demoTextFile.txt');
    String fileContent = await file.readAsString();
    print('File Content: $fileContent');
  }

  zipMaker() async {
    Directory? directory = await getExternalStorageDirectory();
    String dirPath = directory!.path;
    print(directory.path);
    var zipEncoder = ZipFileEncoder();
    zipEncoder.create(directory.path + "/" + 'demoJPGFileLock.zip');
    zipEncoder.addFile(File('$dirPath/IMG_20211127_093259.jpg'));
    zipEncoder.close();
  }

  zipExtractor() async {
    Directory? directory = await getExternalStorageDirectory();
    String dirPath = directory!.path;
    print(directory.path);
    List<int> bytes;
    bytes = File('$dirPath/demoJPGFileLock.zip').readAsBytesSync();

    final archive = ZipDecoder().decodeBytes(
      bytes,
      verify: true,
      password: "rahad",
    );

    for (ArchiveFile file in archive) {
      String filename = file.name;
      String decodePath = (dirPath + filename);
      if (file.isFile) {
        List<int> data = file.content;
        File(decodePath)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(decodePath).create(recursive: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String text;
    return Scaffold(
      appBar: AppBar(
        title: Text("Zip Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                writeFile(text = 'Ami Kisu pari na');
              },
              child: const Text("Write"),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                readFile();
              },
              child: const Text("Read"),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                zipMaker();
              },
              child: const Text("Make Zip"),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                zipExtractor();
              },
              child: const Text("Extract Zip"),
            ),
          ],
        ),
      ),
    );
  }
}
