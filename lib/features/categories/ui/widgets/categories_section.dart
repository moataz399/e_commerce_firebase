import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/home_categories_shimmer.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/home_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetCategoriesLoadingState) {
          return const HomeCategoriesShimmer();
        } else if (cubit.categoriesList.isNotEmpty) {
          return SizedBox(
            height: 93.h,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.categoriesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HomeCategoyItem(
                      categoriesModel: cubit.categoriesList[index]);
                }),
          );
        } else if (state is GetCategoriesFailed) {
          return SizedBox(
            height: 93.h,
            child: Center(
              child: Text(state.error),
            ),
          );
        } else {
          return Center(
              child: Text(
            "there is no data",
            style: TextStyles.font18BlackSemiBold,
          ));
        }
      },
    );
  }
}
