import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/framework/theme/colors/app_colors.dart';
import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../../core/framework/theme/spacing /spacing.dart';

class ReusableGameInformationRow extends StatelessWidget {
  const ReusableGameInformationRow({
    super.key,
    required this.icon,
    required this.title,
    required this.label,
  });
  final String icon;
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(
              width: Spacings.spacing16,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: TextSizes.size14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: TextSizes.size14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
