import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/custom_divider.dart';
import 'package:e_commerce_firebase/features/account/ui/widgets/account_header_section.dart';
import 'package:e_commerce_firebase/features/account/ui/widgets/account_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 33.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyles.font18BlackSemiBold,
              ),
              verticalSpace(30),
             const AccountHeaderSection(),
              verticalSpace(16),
              const CustomDivider(),
              const Column(
                children: [
                  AccountListItem(
                    title: "My Orders",
                    screenName: Routes.myOrdersScreen,
                    img: "assets/images/bag.png",
                  ),
                  AccountListItem(
                    title: "Favourites",
                    screenName: Routes.favouriteScreen,
                    img: "assets/images/heart.png",
                  ),
                  AccountListItem(
                    title: "Addresses",
                    screenName: Routes.addressesScreen,
                    img: "assets/images/location.png",
                  ),
                  AccountListItem(
                    title: "Notification",
                    screenName: Routes.notificationsScreen,
                    img: "assets/images/notification.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
