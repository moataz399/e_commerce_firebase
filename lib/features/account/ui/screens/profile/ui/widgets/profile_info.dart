import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/utils/constants.dart';
import 'package:e_commerce_firebase/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: Constants.listTileModel.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100.h,
              child: Center(
                child: ListTile(
                  onTap: () {},
                  leading: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(Constants.listTileModel[index].img),
                        // Provide the image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    Constants.listTileModel[index].title,
                    style: TextStyles.font14BlackMedium,
                  ),
                  subtitle: Text(
                    Constants.listTileModel[index].subtitle,
                    style: TextStyles.font14GreyRegular,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const CustomDivider();
          },
        ),
        CustomDivider(),
        SizedBox(
          height: 100.h,
          child: Center(
            child: ListTile(
              onTap: () {
                context.pushNamed(Routes.changePasswordScreen);
              },
              leading: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/email.png"),
                    // Provide the image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "change Password",
                    style: TextStyles.font14BlackMedium,
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                  // Customize back button color
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
