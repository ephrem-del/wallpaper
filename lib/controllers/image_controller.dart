import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/models/xcategory.dart';

import '../models/ximage.dart';

class ImageController extends GetxController {
  var images = <XImage>[];
  var categories = <XCategory>[];
  var featured = <XImage>[];
  final db = FirebaseFirestore.instance;

  getImages() async {
    await db.collection('images').get().then((snapshot) {
      images = snapshot.docs.map((doc) => XImage.fromSnapshot(doc)).toList();
    });
  }

  getCategories() async {
    await db.collection('categories').get().then((snapshot) {
      categories =
          snapshot.docs.map((doc) => XCategory.fromSnapshot(doc)).toList();
    });
  }

  getFeatured() async {
    await db.collection('featured').get().then((snapshot) {
      featured = snapshot.docs.map((doc) => XImage.fromSnapshot(doc)).toList();
    });
  }
}
