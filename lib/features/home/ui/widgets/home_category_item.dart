import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/shimmer_effect.dart';
import '../../../categories/data/models/categories_model.dart';

class HomeCategoyItem extends StatelessWidget {
  const HomeCategoyItem({
    super.key,
    required this.categoriesModel,
  });

  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8.w,
      ),
      child: SizedBox(
        width: 73.75.w,
        height: 86.h,
        child: GestureDetector(
          onTap: () {
            context.pushNamed(Routes.categoryDetailsScreen, arguments: {
              "items": categoriesModel.items,
              "title": categoriesModel.title,
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 62.w,
                height: 62.h,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1B1956).withOpacity(.04),
                      spreadRadius: 0,
                      blurRadius: 18,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 62.w,
                      height: 62.h,
                      child: CachedNetworkImage(
                        height: 90.h,
                        imageUrl: categoriesModel.image,
                        progressIndicatorBuilder: (context, url, progress) =>
                            ShimmerEffet(
                          width: 62.w,
                          height: 62.h,
                          raduis: 12,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 50.w,
                child: Text(
                  categoriesModel.title,
                  textAlign: TextAlign.center,
                  style: TextStyles.font12BlackRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
