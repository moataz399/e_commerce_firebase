import 'package:e_commerce_firebase/core/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';


class ExpandableText extends StatefulWidget {
  const ExpandableText({super.key, required this.text});
  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool hiddenText = true;
  double textHeight = 125.h;
  late String firstHalf;
  late String secondHalf;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.8,
              text: firstHalf,
              size: 16,
              color: AppColors.darkBlue,
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    height: 1.8,
                    size: 16,
                    color: AppColors.darkBlue,
                    text: hiddenText
                        ? '$firstHalf...'
                        : (firstHalf + secondHalf),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: hiddenText ? 'Show more' : 'Show less',
                          color: AppColors.mainGreen,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        hiddenText
                            ? const Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.mainGreen,
                                size: 16,
                              )
                            : const Icon(
                                Icons.arrow_drop_up,
                                color: AppColors.mainGreen,
                                size: 16,
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
