import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.mainBackground,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: const Center(
          child: Text(
            'NotificationView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
