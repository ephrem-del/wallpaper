import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/controllers/image_controller.dart';
import 'package:wallpaper/utils/xcolors.dart';
import 'package:wallpaper/utils/ximages.dart';
import 'package:wallpaper/views/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ImageController controller;
  @override
  void initState() {
    controller = Get.put(ImageController());
    super.initState();
  }

  getImages() {
    controller.getCategories();
    controller.getImages();
    controller.getFeatured();
  }

  next() {
    getImages();
    Future.delayed(
      Duration(seconds: 2),
    ).then(
      (value) => Get.to(() => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: XColor.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              XImages.appLogo,
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 100,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('AWESOME'),
                    RotateAnimatedText('COLORFUL'),
                    RotateAnimatedText('BEAUTIFUL'),
                  ],
                  pause: Duration(milliseconds: 100),
                  onTap: () {
                    print("Tap Event");
                  },
                  totalRepeatCount: 1,
                  onFinished: next,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
