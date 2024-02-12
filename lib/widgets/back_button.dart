import 'package:flutter/material.dart';
import 'package:movie_magic/utils/colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 80,
        width: 50,
        margin: const EdgeInsets.only(top: 10, left: 5),
        decoration: BoxDecoration(
            color: CustomColors.black, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
