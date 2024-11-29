import 'package:betting_app/app/modules/Dashboard/presentation/portions/past_matches_portion.dart';
import 'package:betting_app/core/framework/app_images/app_images.dart';
import 'package:betting_app/core/framework/app_texts/apptexts.dart';
import 'package:betting_app/core/framework/theme/spacing%20/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/framework/theme/colors/app_colors.dart';
import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../bloc/match_details_bloc.dart';
import '../../event/match_details_event.dart';
import '../../state/match_details_state.dart';
import '../widget/reusable_club_table_row.dart';
import '../widget/reusable_game_information_row.dart';
import '../widget/reusable_match_stats_row.dart';
import '../widget/reusable_player_of_the_match_row.dart';
import '../widget/reusable_table_row.dart';

class OverviewPortion extends StatefulWidget {
  const OverviewPortion({super.key});

  @override
  State<OverviewPortion> createState() => _OverviewPortionState();
}

class _OverviewPortionState extends State<OverviewPortion> {
  @override
  void initState() {
    context.read<MatchDetailsBloc>().add(FetchBestPlayerEvent());

    context.read<MatchDetailsBloc>().add(FetchHighlightsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Pngs.bigFieldBackground,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppTexts.watchHighlight,
                            style: TextStyle(
                              fontSize: TextSizes.size12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ReusableClubColumn(
                              club: "Barcelona",
                              clubLogo: Pngs.bacaBig,
                              textSize: TextSizes.size12,
                              textColor: AppColors.white,
                              textFontWeight: FontWeight.w600,
                            ),
                            BlocConsumer<MatchDetailsBloc, MatchDetailsState>(
                              listener: (context, state) {
                                if (state is MatchDetailsError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Error: ${state.message}')),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is MatchDetailsLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is MatchDetailsLoaded) {
                                  if (state
                                      .highlights!.data.highlights.isNotEmpty) {
                                    final highlight =
                                        state.highlights!.data.highlights.first;
                                    void launchURL(context, String url) async {
                                      final uri = Uri.parse(url);
                                      if (await canLaunchUrl(uri)) {
                                        await launchUrl(uri,
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Could not launch URL'),
                                          ),
                                        );
                                      }
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        launchURL(context, highlight.url);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Spacings.spacing60,
                                          ),
                                          color: AppColors.white.withOpacity(
                                            0.3,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          size: Spacings.spacing60,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child: Text('No highlights available'));
                                  }
                                }
                                return const SizedBox();
                              },
                            ),
                            const ReusableClubColumn(
                              club: "Girona",
                              clubLogo: Pngs.gBig,
                              textSize: TextSizes.size12,
                              textColor: AppColors.white,
                              textFontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: Spacings.spacing20,
              right: Spacings.spacing20,
            ),
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
                  child: const Row(
                    children: [
                      Text(
                        AppTexts.pOTM,
                        style: TextStyle(
                          fontSize: TextSizes.size14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<MatchDetailsBloc, MatchDetailsState>(
                  listener: (context, state) {
                    if (state is MatchDetailsError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${state.message}')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is MatchDetailsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MatchDetailsLoaded) {
                      final homePlayerInfo =
                          state.bestPlayer!.data.bestHomeTeamPlayer;
                      final awayPlayerInfo =
                          state.bestPlayer!.data.bestAwayTeamPlayer;
                      return Column(
                        children: [
                          ReusablePlayerOfTheMatchRow(
                            playerName: awayPlayerInfo.player.name,
                            rating: awayPlayerInfo.value,
                            club: 'Girona',
                            clubLogo: Pngs.gSmall,
                          ),
                          ReusablePlayerOfTheMatchRow(
                            playerName: homePlayerInfo.player.name,
                            rating: homePlayerInfo.value,
                            club: 'Barcelona',
                            clubLogo: Pngs.bacaSmall,
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Spacings.spacing20,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: Spacings.spacing20,
              right: Spacings.spacing20,
            ),
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
                  child: const Row(
                    children: [
                      Text(
                        AppTexts.lMM,
                        style: TextStyle(
                          fontSize: TextSizes.size14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
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
                    children: [
                      Text(
                        '60%',
                        style: TextStyle(
                            fontSize: TextSizes.size14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Ball Possession',
                            style: TextStyle(
                              color: AppColors.appGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: TextSizes.size12,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '40%',
                        style: TextStyle(
                          fontSize: TextSizes.size14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacings.spacing20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 6,
                          color: AppColors.yellow,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 6,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Spacings.spacing20,
                    left: Spacings.spacing20,
                    bottom: Spacings.spacing20,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(Pngs.bacaSmall),
                                const SizedBox(
                                  width: Spacings.spacing10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: Spacings.spacing4,
                                        left: Spacings.spacing20,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(Svgs.football),
                                          const SizedBox(
                                            width: Spacings.spacing20,
                                          ),
                                          SvgPicture.asset(Svgs.football),
                                          const SizedBox(
                                            width: Spacings.spacing20,
                                          ),
                                          Image.asset(Pngs.cards),
                                          const SizedBox(
                                            width: Spacings.spacing10,
                                          ),
                                          SvgPicture.asset(Svgs.football),
                                          const SizedBox(
                                            width: Spacings.spacing30,
                                          ),
                                          Image.asset(Pngs.noGoal),
                                          const SizedBox(
                                            width: Spacings.spacing20,
                                          ),
                                          SvgPicture.asset(Svgs.redCard),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 339,
                                      color: AppColors.backgroundYellow,
                                      child: BarChart(
                                        BarChartData(
                                          groupsSpace:
                                              0, // No spacing between groups
                                          gridData:
                                              const FlGridData(show: false),
                                          titlesData:
                                              const FlTitlesData(show: false),
                                          borderData: FlBorderData(
                                            show: false,
                                            border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            ),
                                          ),
                                          barGroups: _generateBarGroupsHome(),
                                          barTouchData:
                                              BarTouchData(enabled: false),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(Pngs.gSmall),
                                const SizedBox(
                                  width: Spacings.spacing10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 339,
                                      color: AppColors.backgroundRed,
                                      child: BarChart(
                                        BarChartData(
                                          groupsSpace: 0,
                                          gridData:
                                              const FlGridData(show: false),
                                          titlesData:
                                              const FlTitlesData(show: false),
                                          borderData: FlBorderData(
                                            show: false,
                                            border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            ),
                                          ),
                                          barGroups: _generateBarGroups(),
                                          barTouchData:
                                              BarTouchData(enabled: false),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: Spacings.spacing4,
                                        left: Spacings.spacing20,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(Svgs.football),
                                          const SizedBox(
                                            width: Spacings.spacing40,
                                          ),
                                          SvgPicture.asset(Svgs.football),
                                          const SizedBox(
                                            width: Spacings.spacing10,
                                          ),
                                          Image.asset(Pngs.goal),
                                          const SizedBox(
                                            width: Spacings.spacing40,
                                          ),
                                          Image.asset(Pngs.ownGoal),
                                          const SizedBox(
                                            width: Spacings.spacing30,
                                          ),
                                          Image.asset(Pngs.cards),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Spacings.spacing20,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: Spacings.spacing20,
              right: Spacings.spacing20,
            ),
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
                      Image.asset(Pngs.bacaSmall),
                      const Text(
                        AppTexts.matchCurrentStats,
                        style: TextStyle(
                          fontSize: TextSizes.size14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      Image.asset(Pngs.gSmall),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Spacings.spacing20,
                    left: Spacings.spacing5,
                    right: Spacings.spacing5,
                  ),
                  child: Column(
                    children: [
                      ReusableMatchStatsRow(
                        isOpponent: true,
                        isHome: true,
                        homePlayer: "L. Yamal",
                        homeDescription: "Pen. Missed",
                        homeStatus: Image.asset(Pngs.noGoal),
                        time: "80",
                        opponentPlayer: "Y. Couto",
                        opponentDescription: "Pen. Scored",
                        opponentStatus: Image.asset(Pngs.goal),
                      ),
                      ReusableMatchStatsRow(
                        isOpponent: true,
                        isHome: false,
                        homePlayer: "L. Yamal",
                        homeDescription: "foul",
                        homeStatus: SvgPicture.asset(Svgs.redCard),
                        time: "50",
                        opponentPlayer: "Y. Couto",
                        opponentDescription: "Pen. Scored",
                        opponentStatus: Image.asset(Pngs.goal),
                      ),
                      ReusableMatchStatsRow(
                        isOpponent: false,
                        isHome: true,
                        homePlayer: "L. Yamal",
                        homeDescription: "foul",
                        homeStatus: SvgPicture.asset(Svgs.redCard),
                        time: "20",
                        opponentPlayer: "",
                        opponentDescription: "",
                        opponentStatus: const Text(""),
                      ),
                      ReusableMatchStatsRow(
                        isOpponent: false,
                        isHome: true,
                        homePlayer: "L. Yamal",
                        homeDescription: "foul",
                        homeStatus: SvgPicture.asset(Svgs.redCard),
                        time: "4",
                        opponentPlayer: "",
                        opponentDescription: "",
                        opponentStatus: const Text(""),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Spacings.spacing20,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: Spacings.spacing20,
              right: Spacings.spacing20,
            ),
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
                  child: const Row(
                    children: [
                      Text(
                        AppTexts.liveMatchStanding,
                        style: TextStyle(
                          fontSize: TextSizes.size14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(
                      Spacings.spacing20,
                    ),
                    child: Column(
                      children: [
                        ReusableTableRow(
                          mp: AppTexts.mp,
                          w: AppTexts.w,
                          d: AppTexts.d,
                          l: AppTexts.l,
                          ga: AppTexts.ga,
                          gf: AppTexts.gf,
                          pt: AppTexts.pt,
                        ),
                        SizedBox(
                          height: Spacings.spacing12,
                        ),
                        ReusableClubTableRow(
                          position: "1",
                          clubLogo: Pngs.gSmall,
                          clubName: "Girona",
                          mp: "8",
                          w: "8",
                          d: "0",
                          l: "0",
                          ga: "1",
                          gf: "19",
                          pt: "24",
                          space: 11,
                        ),
                        SizedBox(
                          height: Spacings.spacing8,
                        ),
                        Divider(
                          height: 1,
                          color: AppColors.dividerColor,
                        ),
                        SizedBox(
                          height: Spacings.spacing8,
                        ),
                        ReusableClubTableRow(
                          position: "4",
                          clubLogo: Pngs.bacaSmall,
                          clubName: "Barcelona",
                          mp: "8",
                          w: "2",
                          d: "2",
                          l: "4",
                          ga: "1",
                          gf: "16",
                          pt: "20",
                          space: 11,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: Spacings.spacing20,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: Spacings.spacing20,
              right: Spacings.spacing20,
              bottom: Spacings.spacing20,
            ),
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
                  child: const Row(
                    children: [
                      Text(
                        AppTexts.gameInformation,
                        style: TextStyle(
                          fontSize: TextSizes.size14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(
                    Spacings.spacing20,
                  ),
                  child: Column(
                    children: [
                      ReusableGameInformationRow(
                        icon: Svgs.location,
                        title: AppTexts.venue,
                        label: 'Camp Nou',
                      ),
                      SizedBox(
                        height: Spacings.spacing16,
                      ),
                      ReusableGameInformationRow(
                        icon: Svgs.date,
                        title: AppTexts.date,
                        label: 'March 03, 2024',
                      ),
                      SizedBox(
                        height: Spacings.spacing16,
                      ),
                      ReusableGameInformationRow(
                        icon: Svgs.outline,
                        title: AppTexts.time,
                        label: '21:00',
                      ),
                      SizedBox(
                        height: Spacings.spacing16,
                      ),
                      ReusableGameInformationRow(
                        icon: Svgs.ref,
                        title: AppTexts.referee,
                        label: 'Stephen Hosea',
                      ),
                      SizedBox(
                        height: Spacings.spacing16,
                      ),
                      ReusableGameInformationRow(
                        icon: Svgs.stadium,
                        title: AppTexts.stadiumCapacity,
                        label: '99,354',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    final data = [
      -5,
      -13,
      -3,
      -16,
      -4,
      -1,
      -17,
      -12,
      -6,
      -8,
      -15,
      -9,
      -11,
      -14,
      -7,
      -2,
      -10,
    ];
    return List.generate(data.length, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 0,
        barRods: [
          BarChartRodData(
            borderRadius: BorderRadius.zero,
            toY: data[index].toDouble(),
            width: 6,
            color: AppColors.red,
          ),
        ],
      );
    });
  }

  List<BarChartGroupData> _generateBarGroupsHome() {
    final data = [
      15,
      7,
      4,
      16,
      14,
      12,
      6,
      5,
      13,
      8,
      17,
      1,
      11,
      3,
      2,
      10,
      9,
    ];
    return List.generate(data.length, (index) {
      return BarChartGroupData(
        x: index,
        barsSpace: 0,
        barRods: [
          BarChartRodData(
            borderRadius: BorderRadius.zero,
            toY: data[index].toDouble(),
            width: 6,
            color: AppColors.yellow,
          ),
        ],
      );
    });
  }
}
