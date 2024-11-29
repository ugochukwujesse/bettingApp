import 'package:betting_app/app/modules/Dashboard/presentation/fragments/fantasy_fragment.dart';
import 'package:betting_app/app/modules/Dashboard/presentation/fragments/home_fragment.dart';
import 'package:betting_app/app/modules/Dashboard/presentation/fragments/matches_fragments.dart';
import 'package:betting_app/app/modules/Dashboard/presentation/fragments/my_profile_fragment.dart';
import 'package:betting_app/app/modules/Dashboard/presentation/fragments/shop_fragment.dart';
import 'package:betting_app/core/framework/app_images/app_images.dart';
import 'package:betting_app/core/framework/theme/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/framework/app_texts/apptexts.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> pages = const [
    HomeFragment(),
    MatchesFragment(),
    FantasyFragment(),
    ShopFragment(),
    MyProfileFragment(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: onTap,
          currentIndex: currentIndex,
          backgroundColor: AppColors.white,
          activeColor: AppColors.green,
          inactiveColor: AppColors.appBlack,

          // selectedLabelStyle: const TextStyle(
          //   fontWeight: FontWeight.w500,
          //   fontSize: TextSizes.size12,
          // ),
          // unselectedLabelStyle: const TextStyle(
          //   fontWeight: FontWeight.w500,
          //   fontSize: TextSizes.size12,
          // ),
          // showSelectedLabels: true,
          // showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavIcon(Svgs.home, currentIndex == 0),
              label: AppTexts.home,
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Icons.sports_basketball, currentIndex == 1),
              label: AppTexts.matches,
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Svgs.fantasyIcon, currentIndex == 2),
              label: AppTexts.fantasy,
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(Svgs.shopIcon, currentIndex == 3),
              label: AppTexts.shop,
            ),
            BottomNavigationBarItem(
              icon: _buildNavIcon(
                Pngs.profilePicture,
                currentIndex == 4,
                isPng: true,
              ),
              label: AppTexts.myProfile,
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: HomeFragment(),
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: MatchesFragment(),
                  );
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: FantasyFragment(),
                  );
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: ShopFragment(),
                  );
                },
              );
            case 4:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                    child: MyProfileFragment(),
                  );
                },
              );
            default:
              return CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: HomeFragment(),
                );
              });
          }
        });
  }

  Widget _buildNavIcon(dynamic icon, bool isSelected, {bool isPng = false}) {
    if (isPng) {
      return Image.asset(
        icon,
      );
    } else if (icon is String) {
      return SvgPicture.asset(
        icon,
        color: isSelected ? AppColors.green : AppColors.appBlack,
      );
    } else if (icon is IconData) {
      return Icon(
        icon,
        color: isSelected ? AppColors.green : AppColors.appBlack,
      );
    }
    return const SizedBox();
  }
}
