import 'package:betting_app/app/modules/MatchDetails/presentation/portions/overview_portion.dart';
import 'package:betting_app/core/framework/app_images/app_images.dart';
import 'package:betting_app/core/framework/theme/colors/app_colors.dart';
import 'package:betting_app/core/framework/theme/spacing%20/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/framework/app_texts/apptexts.dart';
import '../../../../core/framework/theme/sizes/sizes.dart';

class MatchDetailsScreen extends StatefulWidget {
  const MatchDetailsScreen({super.key});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: false,
                expandedHeight: 300,
                leading: const SizedBox(),
                backgroundColor: AppColors.appDarkGreen,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        color: AppColors.appDarkGreen,
                        width: double.infinity,
                        child: Image.asset(
                          Pngs.picBackground,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Spacings.spacing40,
                          left: Spacings.spacing20,
                          right: Spacings.spacing20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: Spacings.spacing20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const Text(
                                    AppTexts.matchDetails,
                                    style: TextStyle(
                                      fontSize: TextSizes.size22,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.notifications_none,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: Spacings.spacing30,
                                left: Spacings.spacing20,
                                right: Spacings.spacing20,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const ReusableScoreTacker(
                                    clubLogo: Pngs.bacaMid,
                                    clubName: 'Barcelona',
                                    scorer1: 'R. Lewandowski 11\'',
                                    scorer2: 'J. Felix 25\'',
                                    scorer3: 'J. Cancelo 33\'',
                                    isInverted: false,
                                  ),
                                  Column(
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: '3-',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: TextSizes.size32,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '3',
                                              style: TextStyle(
                                                color: AppColors.appGrey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: TextSizes.size32,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: Spacings.spacing8,
                                      ),
                                      const Text(
                                        "(4-2)",
                                        style: TextStyle(
                                          fontSize: TextSizes.size14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.appGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: Spacings.spacing4,
                                      ),
                                      const Text(
                                        AppTexts.penalty,
                                        style: TextStyle(
                                          fontSize: TextSizes.size14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.appGrey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: Spacings.spacing8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: Spacings.spacing30,
                                        ),
                                        child: SvgPicture.asset(
                                          Svgs.ball,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: Spacings.spacing20,
                                        ),
                                        child: Image.asset(
                                          Pngs.logo,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const ReusableScoreTacker(
                                    clubLogo: Pngs.gMid,
                                    clubName: 'Girona',
                                    scorer1: 'Y. Couto 4\'',
                                    scorer2: 'A. Garcia 15\'',
                                    scorer3: 'I. Martin 27\'',
                                    isInverted: true,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    indicatorColor: AppColors.green,
                    indicatorWeight: 3.0,
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.appGrey,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    tabs: [
                      Tab(text: AppTexts.overview),
                      Tab(text: AppTexts.lineup),
                      Tab(text: AppTexts.statistics),
                      Tab(text: AppTexts.matches),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              OverviewPortion(),
              Center(child: Text(AppTexts.lineup)),
              Center(child: Text(AppTexts.statistics)),
              Center(child: Text(AppTexts.matches)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.appDarkGreen,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ReusableScoreTacker extends StatelessWidget {
  const ReusableScoreTacker(
      {super.key,
      required this.clubLogo,
      required this.clubName,
      required this.scorer1,
      required this.scorer2,
      required this.scorer3,
      required this.isInverted});
  final String clubLogo;
  final String clubName;
  final String scorer1;
  final String scorer2;
  final String scorer3;
  final bool isInverted;

  @override
  Widget build(BuildContext context) {
    return isInverted
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      clubLogo,
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing4,
                  ),
                  Text(
                    clubName,
                    style: const TextStyle(
                      fontSize: TextSizes.size16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing10,
                  ),
                ],
              ),
              Text(
                scorer1,
                style: const TextStyle(
                  fontSize: TextSizes.size14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dividerColor,
                ),
              ),
              const SizedBox(
                height: Spacings.spacing4,
              ),
              Text(
                scorer2,
                style: const TextStyle(
                  fontSize: TextSizes.size14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dividerColor,
                ),
              ),
              const SizedBox(
                height: Spacings.spacing4,
              ),
              Text(
                scorer3,
                style: const TextStyle(
                  fontSize: TextSizes.size14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dividerColor,
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      clubLogo,
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing4,
                  ),
                  Text(
                    clubName,
                    style: const TextStyle(
                      fontSize: TextSizes.size16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: Spacings.spacing10,
                  ),
                ],
              ),
              Text(
                scorer1,
                style: const TextStyle(
                  fontSize: TextSizes.size14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dividerColor,
                ),
              ),
              const SizedBox(
                height: Spacings.spacing4,
              ),
              Text(
                scorer2,
                style: const TextStyle(
                  fontSize: TextSizes.size14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dividerColor,
                ),
              ),
              const SizedBox(
                height: Spacings.spacing4,
              ),
              Text(
                scorer3,
                style: const TextStyle(
                  fontSize: TextSizes.size14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dividerColor,
                ),
              ),
            ],
          );
  }
}
