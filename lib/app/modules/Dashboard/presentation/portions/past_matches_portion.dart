import 'package:betting_app/app/modules/MatchDetails/presentation/match_details_screen.dart';
import 'package:betting_app/core/framework/app_texts/apptexts.dart';
import 'package:betting_app/core/framework/theme/colors/app_colors.dart';
import 'package:betting_app/core/framework/theme/sizes/sizes.dart';
import 'package:betting_app/core/framework/theme/spacing%20/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../../core/framework/app_images/app_images.dart';

class PastMatchesPortion extends StatefulWidget {
  const PastMatchesPortion({super.key});

  @override
  State<PastMatchesPortion> createState() => _PastMatchesPortionState();
}

class _PastMatchesPortionState extends State<PastMatchesPortion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Spacings.spacing20,
        left: Spacings.spacing20,
        right: Spacings.spacing20,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MatchDetailsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Spacings.spacing10,
                ),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 20,
                    offset: Offset(2, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacings.spacing16,
                      vertical: Spacings.spacing10,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Spacings.spacing10,
                        ),
                        topRight: Radius.circular(
                          Spacings.spacing10,
                        ),
                      ),
                      color: AppColors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Pngs.logo,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              AppTexts.laLiga,
                              style: TextStyle(
                                fontSize: TextSizes.size14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Game Week 15",
                          style: TextStyle(
                            fontSize: TextSizes.size14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: Spacings.spacing20,
                      left: Spacings.spacing20,
                      right: Spacings.spacing20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableClubColumn(
                          club: 'Barcelona',
                          clubLogo: Pngs.bacaSmall,
                        ),
                        Column(
                          children: [
                            Text(
                              "May 21, 2024",
                              style: TextStyle(
                                fontSize: TextSizes.size12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.appGrey,
                              ),
                            ),
                            SizedBox(
                              height: Spacings.spacing4,
                            ),
                            Text(
                              "3 - 3",
                              style: TextStyle(
                                fontSize: TextSizes.size18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(
                              height: Spacings.spacing4,
                            ),
                            Text(
                              "Full-time",
                              style: TextStyle(
                                fontSize: TextSizes.size12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.appGrey,
                              ),
                            ),
                          ],
                        ),
                        ReusableClubColumn(
                          club: 'Girona',
                          clubLogo: Pngs.gSmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing8,
                  ),
                  const Divider(
                    height: 1,
                    color: AppColors.dividerColor,
                  ),
                  const SizedBox(
                    height: Spacings.spacing12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableClubColumn extends StatelessWidget {
  const ReusableClubColumn({
    super.key,
    required this.club,
    required this.clubLogo,
    this.textSize,
    this.textFontWeight,
    this.textColor,
  });
  final String club;
  final String clubLogo;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          clubLogo,
        ),
        const SizedBox(
          height: Spacings.spacing4,
        ),
        Text(
          club,
          style: TextStyle(
            fontSize: textSize ?? TextSizes.size14,
            fontWeight: textFontWeight ?? FontWeight.w400,
            color: textColor ?? AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}
