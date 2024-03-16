import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/routing/routes.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountHeaderSection extends StatelessWidget {
  const AccountHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 24,
        color: Colors.grey,
      ),
      onTap: () {
        // context.pushNamed(Routes.addressesScreen);
        context.pushNamed(Routes.profileScreen);
      },
      leading: Container(
        width: 48.w,
        height: 48.h,
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
        "${FirebaseAuth.instance.currentUser!.displayName}",
        style: TextStyles.font14BlackSemiBold,
      ),
      subtitle: Text(
        "${FirebaseAuth.instance.currentUser!.email}",
        style: TextStyles.font12GreyMedium,
      ),
    );
  }
}
