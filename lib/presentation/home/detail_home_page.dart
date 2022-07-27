import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_awesome/core/utils/custome_web_view.dart';
import 'package:project_awesome/data/image/list_image_response.dart';
import 'package:path/path.dart' as paths;

final Dio dio = Dio();

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
  Future<void> _downloadFile({
    required String urlPath,
  }) async {
    final dir = await getApplicationDocumentsDirectory();

    final filename = urlPath.substring(urlPath.lastIndexOf("/") + 1);

    final savePath = paths.join(dir.path, filename);

    await _startDownload(
      savePath: savePath,
      urlPath: urlPath,
      fileName: filename,
    );
  }

  Future<void> _startDownload({
    required String savePath,
    required String urlPath,
    required String fileName,
  }) async {
    Map<String, dynamic> result = {
      "success": false,
      "filePath": null,
      "error": null,
      "done": "done",
    };
    try {
      final response = await dio.download(
        urlPath,
        savePath,
        options: Options(
          headers: {
            'version': '1.0',
          },
        ),
      );

      result["success"] = response.statusCode == 200;
      result["filePath"] = savePath;
    } catch (e) {
      print("error $e");
      result["error"] = e.toString();
    } finally {
      if (result["success"] == true) {
        final FlutterShareMe flutterShareMe = FlutterShareMe();
        await flutterShareMe.shareToWhatsApp(
          imagePath: savePath,
          fileType: FileType.image,
        );
      }
    }
  }

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
                  onTap: () {},
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
                    _downloadFile(
                      urlPath: (widget.photo.src?.original ?? ""),
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
