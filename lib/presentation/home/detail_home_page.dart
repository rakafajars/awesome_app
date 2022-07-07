import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_awesome/core/utils/custome_web_view.dart';
import 'package:project_awesome/data/image/list_image_response.dart';

class DetailHomePage extends StatelessWidget {
  final Photo photo;
  const DetailHomePage({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: photo.src?.original ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            _buildImageErrorLoading(
                      widget: const Padding(
                        padding: EdgeInsets.all(80),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        _buildImageErrorLoading(
                      widget: const Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 32,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${photo.photographer ?? ""} - ${photo.photographerId ?? ""} ",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomeWebView(
                          url: photo.photographerUrl,
                          title: photo.photographer,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    photo.photographerUrl ?? "",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildImageErrorLoading({
    Widget? widget,
  }) {
    int? colorBackground = int.parse(
      "0xFF${photo.avgColor?.replaceAll("#", "")}",
    );
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(colorBackground),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: widget,
    );
  }
}
