import 'package:e_commerce_firebase/features/home/ui/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/constants.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: TextStyles.font18BlackBoldSemiBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16.h),
                GridView.count(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  clipBehavior: Clip.none,
                  childAspectRatio: 1 / 1.2,
                  children: List.generate(
                    Constants.favList.length,
                    (index) =>
                        ProductListItem(productModel: Constants.favList[index]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
