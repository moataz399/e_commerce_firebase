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
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetProductLoadingState) {
          return const ProductListShimmer(title: AppStrings.bestSeller);
        } else if (cubit.productList.isNotEmpty) {
          return Column(
            children: [
              HeaderSection(
                headerTitle: AppStrings.bestSeller,
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
          return Container(
            height: 50,
            width: 50,
            color: Colors.red,
          );
        }
      },
    );
  }
}
