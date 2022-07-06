import 'package:project_awesome/core/network/network_info.dart';
import 'package:project_awesome/data/image/list_image_response.dart';
import 'package:dartz/dartz.dart';
import 'package:project_awesome/remote_data_source/image_remote_data_source.dart';

import '../core/error/error_exceptions.dart';
import '../core/error/failure.dart';

abstract class ImageRepository {
  Future<Either<Failure, List<Photo>>> getImage(String page);
}

class ImageRepositoryImpl implements ImageRepository {
  final NetworkInfo networkInfo;
  final ImageRemoteDataSource remoteDataSource;

  ImageRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Photo>>> getImage(String page) async {
    if (await networkInfo.isConncted) {
      try {
        final imageData = await remoteDataSource.getImage(page);

        return Right(imageData.photos ?? [],);
      } on ServerException {
        return Left(
          ServerFailure(),
        );
      }
    } else {
      return Left(
        ConnectionFailure(),
      );
    }
  }
}
