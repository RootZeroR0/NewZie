import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
// import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/Controller/bottomnavcontroller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
// import 'Controller/BottomNavigationController.dart';

class HomePageController extends StatelessWidget {
  HomePageController({super.key});

  final BottomNewNavController bottomnewnavController =
      Get.put(BottomNewNavController());

  @override
  Widget build(BuildContext context) {
    // BottomNavController controller = Get.put(BottomNavController())

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        elevation: 0,
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(context,
                    icon: IconlyLight.home, label: "Home", page: 0),
                _bottomAppBarItem(context,
                    icon: IconlyLight.search, label: "Search", page: 1),
                _bottomAppBarItem(context,
                    icon: IconlyLight.category, label: "Categories", page: 2),
                _bottomAppBarItem(context,
                    icon: IconlyLight.video, label: "Videos", page: 3),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: bottomnewnavController.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: bottomnewnavController.animateToTab,
        children: [...bottomnewnavController.pages],
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => bottomnewnavController.goToTab(page),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: bottomnewnavController.currentPage == page
                ? Colors.black
                : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
                color: bottomnewnavController.currentPage == page
                    ? Colors.black
                    : Colors.grey,
                fontSize: 13,
                fontWeight: bottomnewnavController.currentPage == page
                    ? FontWeight.w600
                    : null),
          )
        ],
      ),
    );
  }
}
