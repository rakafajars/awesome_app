import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project_awesome/data/image/list_image_response.dart';
import 'package:project_awesome/repositories/image_repository.dart';

import '../../core/error/failure.dart';

part 'all_image_event.dart';
part 'all_image_state.dart';

class AllImageBloc extends Bloc<AllImageEvent, AllImageState> {
  final ImageRepository repository;

  AllImageBloc({
    required ImageRepository repository,
  })  : repository = repository,
        super(AllImageEmpty()) {
    on<AllImageEvent>((event, emit) {
      _fetchAllImage;
    });
  }

  Future<void> _fetchAllImage(
    AllImageEvent event,
    Emitter<AllImageState> emit,
  ) async {
    if (event is GetListImageEvent) {
      final input = event.page;
      emit(AllImageLoading());
      final failureLoaded = await repository.getImage(input);

      emit(
        _eitherLoadedOrErrorState(
          failureOrLoaded: failureLoaded,
          isPaging: false,
        ),
      );
    } else if (event is GetPaginationListImageEvent) {
      final input = event.page;
      emit(AllImageLoadingPagination());
      final failureOrLoaded = await repository.getImage(input);
      emit(
        _eitherLoadedOrErrorState(
          failureOrLoaded: failureOrLoaded,
          page: input,
          isPaging: true,
          listExist: event.listImageResponse,
        ),
      );
    }
  }

  _eitherLoadedOrErrorState({
    required Either<Failure, List<Photo>> failureOrLoaded,
    required bool isPaging,
    String? page,
    ListImageResponse? listExist,
  }) {
    return failureOrLoaded.fold(
      (failure) => _eitherErrorPaginationState(
        failure: failure,
        isPaging: isPaging,
      ),
      (trivia) => _eitherLoadedOrEmptyState(
        data: trivia,
        page: page,
        isPaging: isPaging,
        listExist: listExist,
      ),
    );
  }

  _eitherErrorPaginationState({
    required Failure failure,
    required bool isPaging,
  }) {
    if (isPaging) {
      return AllImageEmptyPagination();
    } else {
      switch (failure.runtimeType) {
        case ServerFailure:
          return const AllImageError(message: 'Server Failure');
        case CacheFailure:
          return const AllImageError(message: 'Cache  Failure');

        default:
          return 'Unexpected error';
      }
    }
  }

  _eitherLoadedOrEmptyState({
    required List<Photo> data,
    required bool isPaging,
    String? page,
    ListImageResponse? listExist,
  }) {
    if (data.isNotEmpty) {
      if (isPaging) {
        if (page != null && int.parse(page) == (listExist?.page ?? 0) + 1) {
          for (var element in data) {
            listExist?.photos?.add(element);
          }

          return AllImageLoaded(
            listPhoto: listExist?.photos,
            page: page,
          );
        } else {
          return AllImageLoaded(
            listPhoto: listExist!.photos,
            page: listExist.page.toString(),
          );
        }
      } else {
        return AllImageLoaded(
          listPhoto: data,
          page: '1',
        );
      }
    } else {
      return isPaging ? AllImageEmptyPagination() : AllImageEmpty();
    }
  }
}
