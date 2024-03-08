import 'package:e_commerce_firebase/core/di/dependency_injection.dart';
import 'package:e_commerce_firebase/core/helpers/cache_helper.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/dots_indicator.dart';
import '../widgets/on_boarding_rounded_container.dart';
import '../widgets/onboarding_page_view_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: Constants.onBoardingListData.length,
                      onPageChanged: (index) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return OnBoardPageViewItem(
                          img: Constants.onBoardingListData[index].img,
                          title: Constants.onBoardingListData[index].title,
                          description:
                              Constants.onBoardingListData[index].description,
                        );
                      }),
                ),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      Constants.onBoardingListData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: DotsIndicator(
                          isActive: pageIndex == index,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 60.h),
                  child: AppTextButton(
                      buttonText: pageIndex != 2 ? "Next" : "Start Shopping",
                      textStyle: TextStyles.font15WhiteBold,
                      onPressed: () {
                        if (pageIndex == 2) {
                          getIt<CacheHelper>().saveData(
                              key: AppStrings.onBoardingKey, value: true);
                          context.pushNamedAndRemoveUntil(Routes.loginScreen,
                              predicate: (Route<dynamic> route) => false);
                        } else {
                          pageController.animateToPage(pageIndex + 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      }),
                ),
              ],
            ),
            Positioned(
              top: -10.h,
              left: 250.w,
              child: const OnBoardingRoundedContainer(
                color: Color(0xffF5BD60),
              ),
            ),
            Positioned(
              top: 300.h,
              left: -100.w,
              child: const OnBoardingRoundedContainer(color: Color(0xff036832)),
            ),
          ],
        ));
  }
}
