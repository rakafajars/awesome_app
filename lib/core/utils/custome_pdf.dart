import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import '../../data/image/list_image_response.dart';

class CustomePdf {
  final pdf = pw.Document();

  static Future<File> openPdf(
    Photo photo,
  ) async {
    final pdf = pw.Document();

    final netImage = await networkImage(photo.src?.original ?? "");

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Image(netImage),
            pw.Text(
              photo.photographer ?? "",
            ),
            pw.Text(
              photo.photographerUrl ?? "",
            ),
          ],
        ),
      ),
    );

    return _saveDocument(name: '${photo.photographer}.pdf', pdf: pdf);
  }

  static Future<File> _saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    // pdf save to the variable called bytes
    final bytes = await pdf.save();

    // here a beautiful pakage  path provider helps us and take dircotory and name of the file  and made a proper file in internal storage
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    // reterning the file to the top most method which is generate centered text.
    return file;
  }
}
