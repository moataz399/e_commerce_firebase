
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_firebase/core/helpers/extensions.dart';
import 'package:e_commerce_firebase/core/theming/colors.dart';
import 'package:e_commerce_firebase/core/widgets/shimmer_effect.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/calculate_price.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    Key? key,
    required this.productModel,
    this.sameProductId,
  }) : super(key: key);
  final ProductModel productModel;
  final int? sameProductId;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  void checkFavoriteStatus() async {
    bool result =
        await context.read<HomeCubit>().isProductFavorite(widget.productModel);
    if (mounted) {
      setState(() {
        isFavorite = result;
      });
    }
  }

  Future<void> toggleFavoriteStatus() async {
    if (isFavorite) {
      // If currently a favorite, remove it

      await context
          .read<HomeCubit>()
          .removeFavoriteProduct(widget.productModel);
    } else {
      // If not a favorite, add it
      await context.read<HomeCubit>().addFavoriteProduct(widget.productModel);
    }
    // Then update the state to reflect the change
    if (mounted) {
      setState(() {
        isFavorite = !isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.productModel.productId == widget.sameProductId
        ? Container()
        : InkWell(
            onTap: () {
              context.pushNamed(Routes.productsDetailsScreen,
                  arguments: {"productModel": widget.productModel});
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              width: 164.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1B1956).withOpacity(.04),
                    spreadRadius: 0,
                    blurRadius: 18,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      widget.productModel.discountValue == 0
                          ? Container()
                          : Container(
                              padding: const EdgeInsets.symmetric(),
                              width: 37.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: const Color(0xFFFF6264),
                              ),
                              child: Center(
                                child: Text(
                                  "%${widget.productModel.discountValue}",
                                  style: TextStyles.font12WhiteSemiBold,
                                ),
                              ),
                            ),
                      InkWell(
                        onTap: () async {
                          await toggleFavoriteStatus();
                        },
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 24,
                          color:
                              isFavorite ? AppColors.mainGreen : Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    child: CachedNetworkImage(
                      height: 110.h,
                      imageUrl: widget.productModel.image,
                      progressIndicatorBuilder: (context, url, progress) => ShimmerEffet(width: 164.w, height: 110.h),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                      fit: BoxFit.fill,
                    ),
                  ),
                  verticalSpace(13),
                  Text(
                    widget.productModel.title,
                    style: TextStyles.font14BlackRegular.copyWith(
                      color: const Color(0xFF01221D),
                    ),
                  ),
                  verticalSpace(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.productModel.discountValue == 0
                          ? Text("\$${widget.productModel.price.toString()}",
                              style: TextStyles.font14BlackBold)
                          : Text(
                              "\$${calcPrice(productPrice: widget.productModel.price, discountValue: widget.productModel.discountValue)}",
                              style: TextStyles.font14BlackBold),
                      horizontalSpace(6.w),
                      widget.productModel.discountValue == 0
                          ? Container()
                          : Text(
                              "\$${widget.productModel.price}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
