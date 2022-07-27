import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_awesome/data/image/list_image_response.dart';
import 'package:project_awesome/presentation/home/detail_home_page.dart';

import '../../../injection_container.dart';

class ItemPhotoList extends StatelessWidget {
  final Photo photo;
  const ItemPhotoList({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? colorBackground = int.parse(
      "0xFF${photo.avgColor?.replaceAll("#", "")}",
    );
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailHomePage(
                    photo: photo,
                  ),
                ),
              );
            },
            child: Container(
              width: 200.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color(colorBackground),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              margin: const EdgeInsets.only(
                left: 6,
                right: 6,
                bottom: 6,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: photo.src?.small ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(
                      color: Colors.indigoAccent,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          photo.photographer ?? "",
        ),
      ],
    );
  }
}
