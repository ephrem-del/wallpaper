import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/ximage.dart';

class ImagePage extends StatelessWidget {
  final XImage image;
  const ImagePage({super.key, required this.image});

  download() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: image.url,
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: image.url,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(image.name),
              IconButton(
                onPressed: download,
                icon: Icon(
                  Icons.download,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
