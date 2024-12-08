import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/components/snackbar.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class DetailProductView extends GetView {
  const DetailProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.mainBackground,
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Product',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const FavoriteCard(),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: Button(
              label: 'Rent Now',
              type: ButtonType.primary,
              state: ButtonState.enabled,
              onPressed: () {
                SnackBarWidget.showSnackBar(
                  "Success Rent Car",
                  "Your Will be Contacted Soon",
                  "succ",
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardImage(),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CardInfo(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Spesification",
          style: AppTypography.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const SpesificationItem(
          icon: 'assets/icons/seat.svg',
          title: '7 Seats',
        ),
        const SizedBox(height: 8),
        const SpesificationItem(
          icon: 'assets/icons/checked-bag.svg',
          title: 'Large Bag',
        ),
        const SizedBox(height: 8),
        const SpesificationItem(
          icon: 'assets/icons/auto-transmission.svg',
          title: 'Automatic',
        ),
        const SizedBox(height: 8),
        const SpesificationItem(
          icon: 'assets/icons/weui_display.svg',
          title: 'Dynamic Head Unit 7" Display',
        ),
      ],
    );
  }
}

class SpesificationItem extends StatelessWidget {
  const SpesificationItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            icon,
            height: 300,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: AppTypography.bodyMedium,
        ),
      ],
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/on-boarding-1.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    );
  }
}
