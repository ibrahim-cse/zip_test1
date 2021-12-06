// import 'dart:io';
// import 'package:archive/archive.dart';
// import 'package:archive/archive_io.dart';
//
// void mainZip() {
//   // Read the Zip file from disk.
//   final bytes = File('test.zip').readAsBytesSync();
//
//   // Decode the Zip file
//   final archive = ZipDecoder().decodeBytes(bytes);
//
//   // Extract the contents of the Zip archive to disk.
//   for (final file in archive) {
//     final filename = file.name;
//     if (file.isFile) {
//       final data = file.content as List<int>;
//       File('out/' + filename)
//         ..createSync(recursive: true)
//         ..writeAsBytesSync(data);
//     } else {
//       Directory('out/' + filename).create(recursive: true);
//     }
//   }
//
//   // Encode the archive as a BZip2 compressed Tar file.
//   final tar_data = TarEncoder().encode(archive);
//   final tar_bz2 = BZip2Encoder().encode(tar_data);
//
//   // Write the compressed tar file to disk.
//   final fp = File('test.tbz');
//   fp.writeAsBytesSync(tar_bz2);
//
//   // Zip a directory to out.zip using the zipDirectory convenience method
//   var encoder = ZipFileEncoder();
//   encoder.zipDirectory(Directory('out'), filename: 'out.zip');
//
//   // Manually create a zip of a directory and individual files.
//   encoder.create('out2.zip');
//   encoder.addDirectory(Directory('out'));
//   encoder.addFile(File('test.zip'));
//   encoder.close();
// }

//-------

// _write() async {
//   String text = '';
//   final Directory directory = await getApplicationDocumentsDirectory();
//   print(directory.path);
//   final File file = File('${directory.path}/my_file.txt');
//   await file.writeAsString(text);
// }

// Future<String?> _read() async {
//   String? text;
//   try {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final File file = File('${directory.path}/my_file.txt');
//     text = await file.readAsString();
//   } catch (e) {
//     print("Couldn't read file");
//   }
//   return text;
// }

// _openFile() async {
//   final Directory directory = await getApplicationDocumentsDirectory();
//   final Directory? directory1 = await getExternalStorageDirectory();
//   // final String dirPath = extDir.path.toString().substring(0, 20);
//   // await File(dirPath).create(recursive: true);
//   // const String filePath = '/storage/emulated/1/Download/';
//   print(directory.path);
//   print(directory1!.path);
//
//   // final bytes = File(filePath).readAsBytesSync();
//   // final archive = ZipDecoder().decodeBytes(bytes);
//   //
//   // for (final file in archive) {
//   //   final filename = file.name;
//   //   if (file.isFile) {
//   //     final data = file.content as List<int>;
//   //     File('out/' + filename)
//   //       ..createSync(recursive: true)
//   //       ..writeAsBytesSync(data);
//   //   } else {
//   //     Directory('out/' + filename).create(recursive: true);
//   //   }
//   // }
//   // final tar_data = TarEncoder().encode(archive);
//   // final tar_bz2 = BZip2Encoder().encode(tar_data);
//   //
//   // final fp = File('ezyzip.zip');
//   // fp.writeAsBytesSync(tar_bz2);
//   //
//   // var encoder = ZipFileEncoder();
//   // encoder.zipDirectory(Directory('out'), filename: 'out.zip');
//   //
//   // encoder.create('ezyzip.zip');
//   // encoder.addDirectory(Directory('out'));
//   // encoder.addFile(File('ezyzip.zip'));
//   // encoder.close();
// }
