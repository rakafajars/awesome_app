part of 'all_image_bloc.dart';

abstract class AllImageState extends Equatable {
  @override
  List<Object> get props => [];
}

class AllImageEmpty extends AllImageState {
  @override
  List<Object> get props => [];
}

class AllImageLoading extends AllImageState {
  @override
  List<Object> get props => [];
}

class AllImageLoaded extends AllImageState {
  final List<Photo> listPhoto;
  final String page;

  AllImageLoaded({required this.listPhoto, required this.page});
  @override
  List<Object> get props => [
        listPhoto,
        page,
      ];
}

class AllImageError extends AllImageState {
  final String message;

  AllImageError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class AllImageEmptyPagination extends AllImageState {
  @override
  List<Object> get props => [];
}

class AllImageLoadingPagination extends AllImageState {
  @override
  List<Object> get props => [];
}
