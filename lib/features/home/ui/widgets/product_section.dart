import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/core/widgets/product_list_shimmer.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spacing.dart';
import 'header_section.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetProductSuccessState ||
          current is GetProductLoadingState ||
          current is GetProductFailedState,
      builder: (context, state) {
        if (state is GetProductLoadingState) {
          return const ProductListShimmer(title: AppStrings.products);
        } else if (cubit.productList.isNotEmpty) {
          return Column(
            children: [
              HeaderSection(
                headerTitle: AppStrings.products,
                productModel: cubit.productList,
              ),
              verticalSpace(16),
              ProductsListView(productModel: cubit.productList),
            ],
          );
        } else if (state is GetCategoriesFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return SizedBox(
            child: Text(
              "There is no data",
              style: TextStyles.font18BlackSemiBold,
            ),
          );
        }
      },
    );
  }
}
