import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTypography {
  static TextStyle? bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
      color: AppColors.black
    );
  }

  static TextStyle? subText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 13,
    );
  }

  static TextStyle? highlightText(BuildContext context) {
    return Theme.of(context).textTheme.headline1?.copyWith(
        color: AppColors.black,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 24,
    );
  }
}
