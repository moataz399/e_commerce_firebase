import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
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
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.grey,
                ),
                onTap: () {
                 // context.pushNamed(Routes.addressesScreen);
                  context.pushNamed(Routes.notificationsScreen);
                },
                leading: Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      // Provide the image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  "Moataz moahmed",
                  style: TextStyles.font14BlackSemiBold,
                ),
                subtitle: Text(
                  "Mohamed Ahmed66@gmail.com",
                  style: TextStyles.font12GreyMedium,
                ),
              ),
              verticalSpace(16),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.withOpacity(.2),
              ),
              SizedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
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
                              context.pushNamed(Routes.favouriteScreen);
                            },
                            leading: Container(
                              width: 24.w,
                              height: 24.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/bag.png'),
                                  // Provide the image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              "My orders",
                              style: TextStyles.font14BlackMedium,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.withOpacity(.2),
                      );
                    },
                    itemCount: 9),
              )
            ],
          ),
        ),
      ),
    );
  }
}
