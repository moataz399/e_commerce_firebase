import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'banners_dots_indicator.dart';

class BannersSlider extends StatefulWidget {
  const BannersSlider({super.key});

  @override
  State<BannersSlider> createState() => _BannersSliderState();
}

class _BannersSliderState extends State<BannersSlider> {
  List<String> banners = [
    "assets/images/banner.png",
    "assets/images/banner.png",
    "assets/images/banner.png",
    "assets/images/banner.png",

  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map(
                (e) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 134.h,
            initialPage: 0,
            autoPlay: true,
            viewportFraction: 1.0,
            reverse: false,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayInterval: const Duration(seconds: 3),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, page) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ),
        verticalSpace(8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              banners.length,
              (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: BannersDotsIndicator(
                  isActive: pageIndex == index,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
