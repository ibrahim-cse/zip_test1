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
  File? imageFile;

  _openFile(BuildContext context) async {
    var picture = (await getApplicationDocumentsDirectory()).path;
    print(picture);

    final bytes = File(picture).readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);
    print(bytes);

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File('out/' + filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('out/' + filename).create(recursive: true);
      }
    }
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
                _openFile(context);
              },
              child: Text(
                "Button 1",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
