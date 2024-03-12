import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/product_list_shimmer.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spacing.dart';
import 'header_section.dart';

class BestSellersSection extends StatelessWidget {
  const BestSellersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetProductSuccessState ||
          current is GetProductLoadingState ||
          current is GetProductFailedState,
      builder: (context, state) {
        final cubtit = context.read<HomeCubit>();
        if (state is GetProductLoadingState) {
          return const ProductListShimmer(title: AppStrings.bestSeller);
        } else if (state is GetProductSuccessState) {
          return Column(
            children: [
              HeaderSection(
                headerTitle: AppStrings.bestSeller,
                productModel: cubtit.productList,
              ),
              verticalSpace(16),
              ProductsListView(productModel: cubtit.productList),
            ],
          );
        } else if (state is GetCategoriesFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
