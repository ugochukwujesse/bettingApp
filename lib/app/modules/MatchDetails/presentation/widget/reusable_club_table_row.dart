import 'package:betting_app/app/modules/MatchDetails/presentation/widget/reusable_table_row.dart';
import 'package:flutter/material.dart';

import '../../../../../core/framework/theme/colors/app_colors.dart';
import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../../core/framework/theme/spacing /spacing.dart';

class ReusableClubTableRow extends StatelessWidget {
  const ReusableClubTableRow({
    super.key,
    required this.position,
    required this.clubLogo,
    required this.clubName,
    required this.mp,
    required this.w,
    required this.d,
    required this.l,
    required this.ga,
    required this.gf,
    required this.pt,
    required this.space,
  });
  final String position;
  final String clubLogo;
  final String clubName;
  final String mp;
  final String w;
  final String d;
  final String l;
  final String ga;
  final String gf;
  final String pt;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              position,
              style: const TextStyle(
                fontSize: TextSizes.size14,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              width: Spacings.spacing16,
            ),
            Image.asset(clubLogo),
            const SizedBox(
              width: Spacings.spacing12,
            ),
            Text(
              clubName,
              style: const TextStyle(
                fontSize: TextSizes.size14,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        ReusableTableRow(
          space: space,
          mp: mp,
          w: w,
          d: d,
          l: l,
          ga: ga,
          gf: gf,
          pt: pt,
        ),
      ],
    );
  }
}
