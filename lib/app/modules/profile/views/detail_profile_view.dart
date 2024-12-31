import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailProfileView extends GetView {
  const DetailProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.mainBackground,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(controller.userDetails["ktp_url"] ??
                          'assets/images/on-boarding-1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "My Personal Data",
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 21,
                        itemBuilder: (context, index) {
                          List keys = [
                            "id",
                            "email",
                            "phone",
                            "nik",
                            "name",
                            "pob",
                            "dob",
                            "gender",
                            "religion",
                            "marital_status",
                            "occupation",
                            "nationality",
                            "photo_url",
                            "ktp_url",
                            "address",
                            "province",
                            "city",
                            "subdistrict",
                            "village",
                            "rt",
                            "rw"
                          ];
                          if (keys[index] == "ktp_url" ||
                              keys[index] == "photo_url" ||
                              keys[index] == "id") {
                            return const SizedBox();
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: PersonalItem(
                                title: keys[index]?.toString() ?? "-",
                                value:
                                    controller.userDetails[keys[index]] ?? "-",
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalItem extends StatelessWidget {
  const PersonalItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width * 0.3,
          child: Text(
            title,
            style: AppTypography.bodyMedium,
          ),
        ),
        SizedBox(
          width: Get.width * 0.49,
          child: Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.formStroke,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
