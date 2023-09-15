import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/models/xcategory.dart';
import 'package:wallpaper/models/ximage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaper/utils/xcolors.dart';
import 'package:wallpaper/utils/xtext_style.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:wallpaper/views/image_page.dart';

class CustomContainer extends StatelessWidget {
  XImage? image;
  XCategory? category;
  CustomContainer({super.key, this.image, this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        image == null
            ? null
            : Get.to(
                () => ImagePage(image: image!),
              );
      },
      child: GlowContainer(
        margin: EdgeInsets.only(top: 8, right: 8, left: 8),
        borderRadius: BorderRadius.circular(
          10,
        ),
        glowColor: XColor.primaryTextColor,
        spreadRadius: 1,
        blurRadius: 5,
        child: Hero(
          tag: image == null ? category!.url : image!.url,
          child: Container(
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    image == null ? category!.url : image!.url,
                  ),
                  fit: BoxFit.cover,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                category != null
                    ? Text(
                        category!.title,
                        style: XTextStyle.categoryTitleTextStyle,
                      )
                    : Text(
                        image!.name,
                        style: XTextStyle.imageCategoryTextStyle,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
