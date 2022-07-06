import 'package:dio/dio.dart';
import 'package:project_awesome/core/error/error_exceptions.dart';
import 'package:project_awesome/data/image/list_image_response.dart';

abstract class ImageRemoteDataSource {
  Future<ListImageResponse> getImage();
}

class ImageRemoteDataImpl implements ImageRemoteDataSource {
  final Dio dio;

  ImageRemoteDataImpl({
    required this.dio,
  });

  @override
  Future<ListImageResponse> getImage() async {
    final response = await dio.get(
      'https://flask-scraping-cncbind.herokuapp.com/api/v1/cnbc-news-articles',
      options: Options(
        headers: {

        }
      ),
    );

    if (response.statusCode == 200) {
      return ListImageResponse.fromJson(
        response.data,
      );
    } else {
      throw ServerException();
    }
  }

}