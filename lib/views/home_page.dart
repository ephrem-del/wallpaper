import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:wallpaper/models/xcategory.dart';
import 'package:wallpaper/models/ximage.dart';
import 'package:wallpaper/utils/xcolors.dart';
import 'package:wallpaper/utils/xtext_style.dart';
import 'package:wallpaper/widgets/custom_container.dart';

import '../controllers/image_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImageController imageController = Get.find();
  var categories = <XCategory>[];
  var featured = <XImage>[];
  @override
  void initState() {
    getCategories();
    super.initState();
  }

  getCategories() {
    categories = imageController.categories;
    featured = imageController.featured;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured',
                    style: XTextStyle.titleTextStyle,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featured.length,
                      itemBuilder: (context, i) {
                        return CustomContainer(
                          image: featured[i],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Text(
                    'Categories',
                    style: XTextStyle.titleTextStyle,
                  ),
            SizedBox(
              height: Get.height - 255,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    return CustomContainer(
                      category: categories[i],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
