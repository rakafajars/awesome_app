import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_awesome/core/utils/custome_download.dart';
import 'package:project_awesome/core/utils/custome_pdf.dart';
import 'package:project_awesome/core/utils/custome_web_view.dart';
import 'package:project_awesome/core/utils/utils_global.dart';
import 'package:project_awesome/data/image/list_image_response.dart';

class DetailHomePage extends StatefulWidget {
  final Photo photo;
  const DetailHomePage({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  // final pdf = pw.Document();
  //
  // Future<File> _openPdf() async {
  //   final pdf = pw.Document();
  //
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Center(
  //         child: pw.Text('Hello World!'),
  //       ),
  //     ),
  //   );
  //
  //   return saveDocument(name: 'my_example.pdf', pdf: pdf);
  // }
  //
  // static Future<File> saveDocument({
  //   required String name,
  //   required pw.Document pdf,
  // }) async {
  //   // pdf save to the variable called bytes
  //   final bytes = await pdf.save();
  //
  //   // here a beautiful pakage  path provider helps us and take dircotory and name of the file  and made a proper file in internal storage
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/$name');
  //
  //   await file.writeAsBytes(bytes);
  //
  //   // reterning the file to the top most method which is generate centered text.
  //   return file;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.photo.src?.original ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            _buildImageErrorLoading(
                      photo: widget.photo,
                      widget: const Padding(
                        padding: EdgeInsets.all(80),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        _buildImageErrorLoading(
                      photo: widget.photo,
                      widget: const Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 32,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 32,
                right: 15,
                child: GestureDetector(
                  onTap: () async {
                    final pdfFile = await CustomePdf.openPdf(
                      widget.photo,
                    );

                    openFile(pdfFile);
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.download,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.photo.photographer ?? ""} - ${widget.photo.photographerId ?? ""} ",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomeWebView(
                          url: widget.photo.photographerUrl,
                          title: widget.photo.photographer,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    widget.photo.photographerUrl ?? "",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () async {
                    CustomeDownload.downloadFile(
                      urlPath: widget.photo.src?.original ?? "",
                    );
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.share,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildImageErrorLoading({Widget? widget, required Photo photo}) {
    int? colorBackground = int.parse(
      "0xFF${photo.avgColor?.replaceAll("#", "")}",
    );
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(colorBackground),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: widget,
    );
  }
}
