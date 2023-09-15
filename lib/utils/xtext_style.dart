import 'package:flutter/material.dart';
import 'package:wallpaper/utils/xcolors.dart';
import 'package:wallpaper/utils/xfont_size.dart';

class XTextStyle {
  static const categoryTitleTextStyle = TextStyle(
    color: XColor.primaryTextColor,
    fontSize: XFontSize.categoryTitleSize,
    fontWeight: FontWeight.bold,
  );
  static const imageCategoryTextStyle = TextStyle(
    color: XColor.primaryTextColor,
    fontSize: XFontSize.imageCategorySize,
  );
  static const titleTextStyle = TextStyle(
    color: XColor.primaryTextColor,
    fontSize: XFontSize.titleSize,
    fontWeight: FontWeight.bold,
  );
}
