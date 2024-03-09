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
     return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetOffersFailed||
          current is GetOffersSuccess ||
          current is OffersLoading,
      builder: (context, state) {
        final cubtit = context.read<HomeCubit>();
        if (state is OffersLoading) {
          return const ProductListShimmer(title: AppStrings.flashOffers);
        } else if (state is GetOffersSuccess) {
          return Column(
            children: [
              HeaderSection(
                headerTitle: AppStrings.flashOffers,
                productModel: cubtit.offersList,
              ),
              verticalSpace(16),
              ProductsListView(productModel: cubtit.offersList),
            ],
          );
        } else if (state is GetOffersFailed) {
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
