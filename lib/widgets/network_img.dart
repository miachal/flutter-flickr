import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flickro/utils.dart';

enum ImageSize { medium, big }

class NetworkImg extends StatelessWidget {
  const NetworkImg(
      {Key? key, required this.image, this.size = ImageSize.medium})
      : super(key: key);

  final Map image;
  final ImageSize size;

  @override
  Widget build(BuildContext context) {
    String imageUrl = size == ImageSize.medium
        ? image['media']['m']
        : Utils.fullImageSize(image['media']['m']);

    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
        child: Center(
            child: CircularProgressIndicator(value: downloadProgress.progress)),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.search),
    );
  }
}
