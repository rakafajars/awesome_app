part of 'all_image_bloc.dart';

abstract class AllImageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetListImageEvent extends AllImageEvent {
  final String page;

  GetListImageEvent({
    required this.page,
  });
  @override
  List<Object> get props => [
        page,
      ];
}

class GetPaginationListImageEvent extends AllImageEvent {
  final String page;
  final ListImageResponse listImageResponse;

  GetPaginationListImageEvent({
    required this.page,
    required this.listImageResponse,
  });
  @override
  List<Object> get props => [
        page,
        listImageResponse,
      ];
}
