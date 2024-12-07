import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailProfileView extends GetView {
  const DetailProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.mainBackground,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/on-boarding-1.jpg'),
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
                  color: AppColors.formFill,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        // final titleList = ["NIK", "Name", "Place of Birth", "Date of Birth", "Gender", ];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: PersonalItem(
                            title: "title",
                            value: "value",
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
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
          width: Get.width * 0.4,
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
