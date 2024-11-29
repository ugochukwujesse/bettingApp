import 'package:betting_app/app/modules/Dashboard/presentation/portions/past_matches_portion.dart';
import 'package:betting_app/core/framework/app_images/app_images.dart';
import 'package:betting_app/core/framework/app_texts/apptexts.dart';
import 'package:betting_app/core/framework/theme/colors/app_colors.dart';
import 'package:betting_app/core/framework/theme/sizes/sizes.dart';
import 'package:betting_app/core/framework/theme/spacing%20/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../MatchDetails/presentation/widget/reusable_league_container.dart';

class MatchesFragment extends StatefulWidget {
  const MatchesFragment({super.key});

  @override
  State<MatchesFragment> createState() => _MatchesFragmentState();
}

class _MatchesFragmentState extends State<MatchesFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(Pngs.fieldBackground),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          Svgs.option,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              Pngs.scorersIcon,
                              scale: 2.0,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    left: 1,
                                  ),
                                  labelText: AppTexts.search,
                                  labelStyle: const TextStyle(
                                      color: AppColors.appGrey,
                                      fontSize: TextSizes.size16,
                                      fontWeight: FontWeight.w500),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: AppColors.appGrey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        Spacings.spacing14),
                                    borderSide: const BorderSide(
                                      color: AppColors.appGrey,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        Spacings.spacing14),
                                    borderSide: const BorderSide(
                                      color: AppColors.appGrey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                        left: Spacings.spacing10,
                        right: Spacings.spacing10,
                        top: Spacings.spacing14,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableLeagueContainer(
                            textColor: AppColors.white,
                            text: AppTexts.all,
                            containerColor: AppColors.green,
                            image: Pngs.worldIcon,
                            padding: 15,
                          ),
                          ReusableLeagueContainer(
                            textColor: AppColors.appGrey,
                            text: AppTexts.epl,
                            containerColor: AppColors.appBlack,
                            image: Pngs.eplIcon,
                          ),
                          ReusableLeagueContainer(
                            textColor: AppColors.appGrey,
                            text: AppTexts.laLiga,
                            containerColor: AppColors.appBlack,
                            image: Pngs.laligaIcon,
                          ),
                          ReusableLeagueContainer(
                            textColor: AppColors.appGrey,
                            text: AppTexts.serieA,
                            containerColor: AppColors.appBlack,
                            image: Pngs.serieIcon,
                          ),
                          ReusableLeagueContainer(
                            textColor: AppColors.appGrey,
                            text: AppTexts.bundesliga,
                            containerColor: AppColors.appBlack,
                            image: Pngs.bunIcon,
                          ),
                          ReusableLeagueContainer(
                            textColor: AppColors.appGrey,
                            text: AppTexts.ligue1,
                            containerColor: AppColors.appBlack,
                            image: Pngs.legue1Icon,
                            padding: 5,
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Container(
                    color: AppColors.appDarkGreen,
                    child: const TabBar(
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
                        Tab(
                          text: 'Live Matches',
                        ),
                        Tab(
                          text: 'New Matches',
                        ),
                        Tab(
                          text: 'Past Matches',
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Center(
                          child: Text('Live Matches Content'),
                        ),
                        Center(
                          child: Text('New Matches Content'),
                        ),
                        PastMatchesPortion(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
