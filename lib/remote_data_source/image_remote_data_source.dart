import 'package:dio/dio.dart';
import 'package:project_awesome/core/error/error_exceptions.dart';
import 'package:project_awesome/data/image/list_image_response.dart';

abstract class ImageRemoteDataSource {
  Future<ListImageResponse> getImage(String page);
}

class ImageRemoteDataImpl implements ImageRemoteDataSource {
  final Dio dio;

  ImageRemoteDataImpl({
    required this.dio,
  });

  @override
  Future<ListImageResponse> getImage(String page) async {
    final response = await dio.get(
      'https://api.pexels.com/v1/curated?page=$page&per_page=12',
      options: Options(
        headers: {
          "Authorization":
              "563492ad6f91700001000001b464699e4345455e9d96310f89c1d0c8"
        },
      ),
    );


    if (response.statusCode == 200) {
      print(page);
      print('Masuk');
      return ListImageResponse.fromJson(
        response.data,
      );
    } else {
      throw ServerException();
    }
  }
}
