import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/modules/favorite/views/favorite_view.dart';
import 'package:cakrawala_app/app/modules/home/views/home_view.dart';
import 'package:cakrawala_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (controller) {
      return Scaffold(
        body: FadeIndexedStack(
          beginOpacity: 0.0,
          endOpacity: 1.0,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          index: controller.tabIndex,
          children: const [
            HomeView(),
            FavoriteView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: true,
            backgroundColor: AppColors.mainBackground,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.formStroke,
            selectedFontSize: 12,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.formStroke,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite),
                icon: Icon(
                  Icons.favorite_border,
                  color: AppColors.formStroke,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline_rounded,
                    color: AppColors.formStroke),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }
}
