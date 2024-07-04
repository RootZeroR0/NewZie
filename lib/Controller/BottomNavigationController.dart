import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/ArticlePage.dart';
import 'package:news_app/Pages/HomePage/HomePage.dart';
import 'package:news_app/Pages/Profile/ProfilePage.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const ArticlePage(),
    const ProfilePage(),
  ];
}