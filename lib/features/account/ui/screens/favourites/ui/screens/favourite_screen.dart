import 'dart:async';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:e_commerce_firebase/features/home/logic/home_cubit.dart';
import 'package:e_commerce_firebase/features/home/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late StreamSubscription<List<ProductModel>> _favoritesSubscription;
  late Stream<List<ProductModel>> _favoritesStream;

  @override
  void initState() {

    super.initState();
    _favoritesStream = context.read<HomeCubit>().listenToFavorites();
    _favoritesSubscription = _favoritesStream.listen((List<ProductModel> data) {
      // Handle stream data
    });
  }

  @override
  void dispose() {
    // Cancel the stream subscription in the dispose method
    _favoritesSubscription.cancel();
    super.dispose();
  }

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
        child: StreamBuilder(
          stream: _favoritesStream,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<ProductModel> favoriteProducts = snapshot.data ?? [];
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        clipBehavior: Clip.none,
                        childAspectRatio: (1 / 1.26).h,
                        children: List.generate(
                          favoriteProducts.length,
                          (index) => ProductItem(
                              key: Key(
                                  favoriteProducts[index].productId.toString()),
                              productModel: favoriteProducts[index]),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
