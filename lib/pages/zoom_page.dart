import 'package:flutter/material.dart';
import 'package:flickro/widgets/network_img.dart';

class ZoomPage extends StatelessWidget {
  const ZoomPage({Key? key, required this.image}) : super(key: key);
  final Map image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image['title']),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          child: NetworkImg(image: image, size: ImageSize.big)),
    );
  }
}
