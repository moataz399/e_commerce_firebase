import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_firebase/core/widgets/custom_back_button.dart';
import 'package:e_commerce_firebase/features/account/ui/screens/profile/ui/widgets/cover_and_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _EditProfileScreenState extends State<EditProfileScreen> {
  double profileHeight = 40.h;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyCustomBackButton(),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CoverAndImage(),
            verticalSpace(16 + profileHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 32.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: nameController,
                      prefixIcon: Icon(Icons.person_2_outlined),
                      hintText: "Moataz moahamed",
                      validator: (value) {},
                    ),
                    AppTextFormField(
                      controller: emailController,
                      prefixIcon: Icon(Icons.person_2_outlined),
                      hintText: "Moataz_moahamed@gmail.com",
                      validator: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
