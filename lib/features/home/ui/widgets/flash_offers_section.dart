import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/utils/app_strings.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/product_list_shimmer.dart';
import '../../logic/home_cubit.dart';
import 'header_section.dart';

class FlashOffersSection extends StatelessWidget {
  const FlashOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is OffersLoading) {
          return const ProductListShimmer(title: AppStrings.flashOffers);
        } else if (cubit.offersList.isNotEmpty) {
          return Column(
            children: [
              HeaderSection(
                headerTitle: AppStrings.flashOffers,
                productModel: cubit.offersList,
              ),
              verticalSpace(16),
              ProductsListView(productModel: cubit.offersList),
            ],
          );
        } else if (state is GetOffersFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const SizedBox(
            child: Text("There is no data"),
          );
        }
      },
    );
  }
}
