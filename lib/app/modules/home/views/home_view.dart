import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/core/styles/form_styles.dart';
import 'package:cakrawala_app/app/modules/product/views/detail_product_view.dart';
import 'package:cakrawala_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        title: const Text(
          'CAKRAWALA',
          style: TextStyle(
            color: AppColors.mainBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: AppTypography.bodyMedium,
                decoration: formStyle().copyWith(
                  hintText: 'Search',
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const TitleDisplay(
                          title: "Best Seller", arguments: "All Best Seller"),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: Get.width * 0.55,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: FavoriteCard(
                                onPressed: () {
                                  Get.to(
                                    () => const DetailProductView(),
                                  );
                                },
                                index: index,
                                isLiked: false,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitleDisplay(
                          title: "Our Cars", arguments: "All Cars"),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items in a row
                          crossAxisSpacing:
                              16, // Horizontal spacing between items
                          mainAxisSpacing: 16, // Vertical spacing between items
                          childAspectRatio:
                              1, // Width-to-height ratio of each item
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return CarCard(
                            onPressed: () {
                              Get.to(
                                () => const DetailProductView(),
                              );
                            },
                            index: index,
                            isLiked: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleDisplay extends StatelessWidget {
  const TitleDisplay({
    super.key,
    required this.title,
    required this.arguments,
  });

  final String title;
  final String arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(arguments: arguments, Routes.PRODUCT);
          },
          child: Text(
            "See All",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.onPressed,
    required this.index,
    required this.isLiked,
  });

  final VoidCallback onPressed;
  final int index;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const CarCardImage(),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: isLiked
                        ? const Icon(
                            Icons.favorite,
                            color: AppColors.error,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: AppColors.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CarCardInfo(),
                CarCardButton(onPressed: onPressed),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.onPressed,
    required this.index,
    required this.isLiked,
  });

  final VoidCallback onPressed;
  final int index;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.height * 0.3,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const CardImage(),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: isLiked
                        ? const Icon(
                            Icons.favorite,
                            color: AppColors.error,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: AppColors.white,
                          ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CardInfo(),
                CardButton(onPressed: onPressed),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CarCardButton extends StatelessWidget {
  const CarCardButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 72,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 0),
        ),
        child: Text(
          "Detail",
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(
          "Detail",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CarCardInfo extends StatelessWidget {
  const CarCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * 0.15,
          child: Text(
            "All New Honda Civic",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: Get.width * 0.15,
          child: Text(
            "Rp. 500.000.000/day",
            style: AppTypography.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class CarCardImage extends StatelessWidget {
  const CarCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * 0.27,
          child: Text(
            "All New Honda Civic",
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: Get.width * 0.27,
          child: Text(
            "Rp. 500.000.000/day",
            style: AppTypography.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
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
      height: 150,
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
