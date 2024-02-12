import 'package:flutter/material.dart';
import 'package:movie_magic/utils/colors.dart';
import 'package:movie_magic/utils/sizes.dart';
import 'package:movie_magic/utils/text_style.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  const CategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: Text(
        title,
        style: CustomTextStyle.protestRiot(
            fontSize: Sizes.mediaWidth(context: context, width: 0.063),
            color: CustomColors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
