import 'package:flutter/material.dart';

import '../../../../../core/framework/theme/colors/app_colors.dart';
import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../../core/framework/theme/spacing /spacing.dart';

class ReusableTableRow extends StatelessWidget {
  const ReusableTableRow({
    super.key,
    required this.mp,
    required this.w,
    required this.d,
    required this.l,
    required this.ga,
    required this.gf,
    required this.pt,
    this.space,
  });
  final String mp;
  final String w;
  final String d;
  final String l;
  final String ga;
  final String gf;
  final String pt;
  final double? space;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          mp,
          style: const TextStyle(
            fontSize: TextSizes.size12,
            fontWeight: FontWeight.w500,
            color: AppColors.appGrey,
          ),
        ),
        SizedBox(
          width: space ?? Spacings.spacing8,
        ),
        Text(
          w,
          style: const TextStyle(
            fontSize: TextSizes.size12,
            fontWeight: FontWeight.w500,
            color: AppColors.appGrey,
          ),
        ),
        SizedBox(
          width: space ?? Spacings.spacing8,
        ),
        Text(
          d,
          style: const TextStyle(
            fontSize: TextSizes.size12,
            fontWeight: FontWeight.w500,
            color: AppColors.appGrey,
          ),
        ),
        SizedBox(
          width: space ?? Spacings.spacing8,
        ),
        Text(
          l,
          style: const TextStyle(
            fontSize: TextSizes.size12,
            fontWeight: FontWeight.w500,
            color: AppColors.appGrey,
          ),
        ),
        SizedBox(
          width: space ?? Spacings.spacing8,
        ),
        Text(
          ga,
          style: const TextStyle(
            fontSize: TextSizes.size12,
            fontWeight: FontWeight.w500,
            color: AppColors.appGrey,
          ),
        ),
        SizedBox(
          width: space ?? Spacings.spacing8,
        ),
        Text(
          gf,
          style: const TextStyle(
            fontSize: TextSizes.size12,
            fontWeight: FontWeight.w500,
            color: AppColors.appGrey,
          ),
        ),
        SizedBox(
          width: space ?? Spacings.spacing8,
        ),
        Text(
          pt,
          style: const TextStyle(
            fontSize: TextSizes.size12,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
