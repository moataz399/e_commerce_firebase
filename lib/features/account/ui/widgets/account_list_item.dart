import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountListItem extends StatelessWidget {
  const AccountListItem(
      {super.key,
      required this.title,
      required this.img,
      required this.screenName});

  final String title;
  final String img;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75.h,
          child: Center(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: Colors.grey,
              ),
              onTap: () {
                context.pushNamed(screenName);
              },
              leading: Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(img),
                    // Provide the image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                title,
                style: TextStyles.font14BlackMedium,
              ),
            ),
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
