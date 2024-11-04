import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/ArticlePage.dart';
import 'package:news_app/Pages/HomePage/HomePage.dart';
import 'package:news_app/Pages/bookmarkPage/NewsVideoPage.dart';
import 'package:news_app/Pages/category/CategoryPage.dart';

class BottomNewNavController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;

  List<Widget> pages = [
    const HomePage(),
    const ArticlePage(),
     CategoryPage(),
    const VideoPage(),
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
  void animateToTab(int page) {
    currentPage.value = page;
   pageController.animateToPage(page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}