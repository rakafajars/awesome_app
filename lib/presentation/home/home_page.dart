import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_awesome/bloc/image/all_image_bloc.dart';
import 'package:project_awesome/presentation/home/widget/item_photo_list.dart';

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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 100.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "Awesome Apps",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: BlocBuilder<AllImageBloc, AllImageState>(
          builder: (context, state) {
            if (state is AllImageLoaded) {
              _listPhoto = state.listPhoto;
              _page = int.parse(state.page);

              return _itemListPhoto(_listPhoto);
            } else if (state is AllImageLoadingPagination) {
              return _itemListPhoto(_listPhoto);
            } else if (state is AllImageEmptyPagination) {
              return _itemListPhoto(_listPhoto);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  GridView _itemListPhoto(List<Photo> photoList) {
    return GridView.builder(
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
    );
  }
}
