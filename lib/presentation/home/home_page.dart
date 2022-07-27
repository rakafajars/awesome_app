import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_awesome/bloc/image/all_image_bloc.dart';
import 'package:project_awesome/presentation/home/widget/item_photo_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/image/list_image_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerScroll = ScrollController();

  int _page = 0;
  List<Photo> _listPhoto = [];

  @override
  void initState() {
    BlocProvider.of<AllImageBloc>(context).add(
      GetListImageEvent(page: "1"),
    );
    _controllerScroll.addListener(() {
      _onScroll(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerScroll.dispose();
    super.dispose();
  }

  void _onScroll(BuildContext context) {
    double maxScroll = _controllerScroll.position.maxScrollExtent;
    double currentScroll = _controllerScroll.position.pixels;
    if (maxScroll == currentScroll) {
      BlocProvider.of<AllImageBloc>(context).add(
        GetPaginationListImageEvent(
          page: (_page + 1).toString(),
          listImageResponse: ListImageResponse(
            page: _page,
            photos: _listPhoto,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AllImageBloc, AllImageState>(
        listener: (context, state) {
          if (state is AllImageError) {
            final snackBar = SnackBar(
              content: Text(state.message),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<AllImageBloc, AllImageState>(
          builder: (context, state) {
            if (state is AllImageLoading) {
              return _itemListPhotoLoading();
            }
            if (state is AllImageError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is AllImageLoaded) {
              _listPhoto = state.listPhoto;
              _page = int.parse(state.page);

              return _itemListPhoto(_listPhoto, false);
            } else if (state is AllImageLoadingPagination) {
              return _itemListPhoto(_listPhoto, true);
            } else if (state is AllImageEmptyPagination) {
              return _itemListPhoto(_listPhoto, false);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  GridView _itemListPhotoLoading() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      controller: _controllerScroll,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: const Color(0xFFE0E0E0),
            highlightColor: const Color(0xFFF5F5F5),
            child: const ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              child: Card(),
            ),
          ),
        );
      },
    );
  }

  Widget _itemListPhoto(List<Photo> photoList, bool isProgress) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _controllerScroll,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: photoList.length,
            itemBuilder: (context, index) {
              return ItemPhotoList(
                photo: photoList[index],
              );
            },
          ),
        ),
        if(isProgress  ==true) ...[
          const SizedBox(height: 4),
          const CircularProgressIndicator(),
        ],
      ],
    );
  }
}
