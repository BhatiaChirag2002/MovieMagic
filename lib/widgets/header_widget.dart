import 'package:flutter/material.dart';
import 'package:movie_magic/utils/colors.dart';
import 'package:movie_magic/utils/sizes.dart';
import 'package:movie_magic/utils/text_style.dart';

class HeaderWidget extends StatelessWidget {
  final double height;
  final double fontSize;
  const HeaderWidget({
    super.key,
    required this.height,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.2),
      child: Container(
        color: CustomColors.black,
        width: double.maxFinite,
        height: Sizes.mediaWidth(context: context, width: height - 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                'assets/images/movie.png',
                filterQuality: FilterQuality.high,
                height:
                    Sizes.mediaWidth(context: context, width: height - 0.05),
                width: Sizes.mediaWidth(context: context, width: height - 0.04),
              ),
            ),
            Text(
              'MovieMagic',
              style: CustomTextStyle.protestRiot(
                  fontSize: Sizes.mediaWidth(context: context, width: fontSize),
                  color: CustomColors.lightRed),
            )
          ],
        ),
      ),
    );
  }
}
