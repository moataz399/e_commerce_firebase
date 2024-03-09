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
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetCategoriesFailed ||
          current is GetCategoriesSuccess ||
          current is GetCategoriesLoadingState,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        if (state is GetCategoriesLoadingState) {
          return const HomeCategoriesShimmer();
        } else if (state is GetCategoriesSuccess) {
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
          return SizedBox();
        }
      },
    );
  }
}
