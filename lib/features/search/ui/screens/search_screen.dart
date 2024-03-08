import 'dart:developer';
import 'package:e_commerce_firebase/core/helpers/spacing.dart';
import 'package:e_commerce_firebase/core/theming/text_styles.dart';
import 'package:e_commerce_firebase/core/widgets/app_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(15),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 288.w,
                    child: AppTextFormField(
                        suffixIcon: searchController.text != ""
                            ? IconButton(
                                onPressed: () {
                                  searchController.text = "";
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              )
                            : const SizedBox(
                                width: 1,
                                height: 1,
                              ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        contentPadding: EdgeInsets.only(top: 10.h, right: 12.w),
                        height: 45.h,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        controller: searchController,
                        hintText: "Search your Product ",
                        validator: (value) {}),
                  ),
                  horizontalSpace(10),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        log(" tapped");
                      },
                      child: Text(
                        "cancel",
                        style: TextStyles.font12BlackRegular,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
