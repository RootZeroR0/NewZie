import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/BottomNavigationController.dart';

class MyBottonNav extends StatelessWidget {
  const MyBottonNav({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 200,
          height: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.index.value = 0;
                },
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: controller.index.value == 0
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: controller.index.value == 1
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                        ),
                      ),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    controller.index.value = 2;
                  },
                  child: Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: controller.index.value == 2
                            ? Theme.of(context).colorScheme.primary
                            : null,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.category,
                          size: 25,
                          color: controller.index.value == 2
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class MyNavigation extends StatelessWidget {
//   const MyNavigation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     BottomNavController controller = Get.put(BottomNavController());
//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.index.value,
//           onDestinationSelected: (index) => controller.index.value = 0,
//           destinations: const [
//             NavigationDestination(icon: Icon(Icons.home), label: 'home'),
//             NavigationDestination(icon: Icon(Icons.search), label: 'search'),
//             NavigationDestination(icon: Icon(Icons.category), label: 'category')
//           ],
//         ),
//       ),
//       body: Obx(() => controller.pages[controller.index.value]),
//     );
//   }
// }
