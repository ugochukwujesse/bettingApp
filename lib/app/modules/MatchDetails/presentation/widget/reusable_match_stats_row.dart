import 'package:flutter/material.dart';

import '../../../../../core/framework/app_images/app_images.dart';
import '../../../../../core/framework/theme/colors/app_colors.dart';
import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../../core/framework/theme/spacing /spacing.dart';

class ReusableMatchStatsRow extends StatelessWidget {
  const ReusableMatchStatsRow({
    super.key,
    required this.isOpponent,
    required this.isHome,
    required this.homePlayer,
    required this.homeDescription,
    required this.homeStatus,
    required this.time,
    required this.opponentPlayer,
    required this.opponentDescription,
    required this.opponentStatus,
  });
  final bool isOpponent;
  final bool isHome;
  final String homePlayer;
  final String homeDescription;
  final Widget homeStatus;
  final String time;
  final String opponentPlayer;
  final String opponentDescription;
  final Widget opponentStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHome
              ? Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        Pngs.yamal,
                      ),
                      const SizedBox(
                        width: Spacings.spacing4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homePlayer,
                            style: const TextStyle(
                              fontSize: TextSizes.size14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(
                            height: Spacings.spacing6,
                          ),
                          Text(
                            "($homeDescription)",
                            style: const TextStyle(
                              fontSize: TextSizes.size12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.appGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: Spacings.spacing10,
                      ),
                      homeStatus,
                    ],
                  ),
                )
              : const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: Spacings.spacing40),
                    child: SizedBox(
                      width: Spacings.spacing60,
                    ),
                  ),
                ),
          CircleAvatar(
            radius: Spacings.spacing16,
            backgroundColor: AppColors.green,
            child: Text(
              time,
              style: const TextStyle(
                fontSize: TextSizes.size12,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          isOpponent
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: Spacings.spacing4,
                      ),
                      opponentStatus,
                      const SizedBox(
                        width: Spacings.spacing10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            opponentPlayer,
                            style: const TextStyle(
                              fontSize: TextSizes.size14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(
                            height: Spacings.spacing6,
                          ),
                          Text(
                            "($opponentDescription)",
                            style: const TextStyle(
                              fontSize: TextSizes.size12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.appGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: Spacings.spacing4,
                      ),
                      Image.asset(
                        Pngs.yamal,
                      ),
                    ],
                  ),
                )
              : const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: Spacings.spacing30),
                    child: SizedBox(
                      width: Spacings.spacing60,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
