

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoverAndImage extends StatelessWidget {
   CoverAndImage({super.key});
  double profileHeight = 40.h;
  double coverHeight = 190.h;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: coverHeight,
          width: double.infinity,
          child: Image.asset(
            "assets/images/cover.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: (coverHeight - profileHeight),
          // Center the profile avatar horizontally
          left:
          (MediaQuery.of(context).size.width - profileHeight * 2) / 2,

          child: CircleAvatar(
            radius: profileHeight,
            backgroundImage: AssetImage(
              "assets/images/person.png",
            ),
          ),
        )
      ],
    );
  }
}
