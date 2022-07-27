import 'package:dio/dio.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as paths;

class CustomeDownload {
  static Dio dio = Dio();

  static Future<void> downloadFile({
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

  static Future<void> _startDownload({
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
}
