import 'package:flutter/material.dart';

import '../../../../../core/framework/app_images/app_images.dart';
import '../../../../../core/framework/theme/colors/app_colors.dart';
import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../../core/framework/theme/spacing /spacing.dart';

class ReusablePlayerOfTheMatchRow extends StatelessWidget {
  const ReusablePlayerOfTheMatchRow({
    super.key,
    required this.playerName,
    required this.rating,
    required this.club,
    required this.clubLogo,
  });
  final String playerName;
  final String rating;
  final String club;
  final String clubLogo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Spacings.spacing20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Pngs.player,
              ),
              const SizedBox(
                width: Spacings.spacing8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playerName,
                    style: const TextStyle(
                      fontSize: TextSizes.size16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.appBlack,
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing8,
                  ),
                  Row(
                    children: [
                      Image.asset(clubLogo),
                      const SizedBox(
                        width: Spacings.spacing4,
                      ),
                      Text(
                        club,
                        style: const TextStyle(
                          fontSize: TextSizes.size14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: Spacings.spacing4,
              horizontal: Spacings.spacing8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Spacings.spacing5,
              ),
              color: AppColors.green,
            ),
            child: Text(
              rating,
              style: const TextStyle(
                fontSize: TextSizes.size12,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
