import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(home: ZipTest()));
}

class ZipTest extends StatefulWidget {
  const ZipTest({Key? key}) : super(key: key);

  @override
  _ZipTestState createState() => _ZipTestState();
}

class _ZipTestState extends State<ZipTest> {
  Future<String> getFilePath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    String dirPath = directory.path;
    String filePath = '$dirPath/demoTextFile.txt';

    return filePath;
  }

  void saveFile() async {
    File file = File(await getFilePath());
    file.writeAsString(
        "This is my demo text that will be saved to : demoTextFile.txt");
  }

  void readFile() async {
    File file = File(await getFilePath());
    String fileContent = await file.readAsString();

    print('File Content: $fileContent');
  }

  @override
  Widget build(BuildContext context) {
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
                saveFile();
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
          ],
        ),
      ),
    );
  }
}
