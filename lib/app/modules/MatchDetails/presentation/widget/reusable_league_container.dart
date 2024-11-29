import 'package:flutter/material.dart';

import '../../../../../core/framework/theme/sizes/sizes.dart';
import '../../../../../core/framework/theme/spacing /spacing.dart';

class ReusableLeagueContainer extends StatelessWidget {
  const ReusableLeagueContainer({
    super.key,
    required this.textColor,
    required this.text,
    required this.containerColor,
    required this.image,
    this.padding,
  });
  final Color containerColor;
  final Color textColor;
  final String text;
  final String image;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(padding ?? 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Spacings.spacing24,
            ),
            color: containerColor,
          ),
          child: Center(
            child: Image.asset(
              image,
            ),
          ),
        ),
        const SizedBox(
          height: Spacings.spacing4,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: TextSizes.size14,
            color: textColor,
          ),
        )
      ],
    );
  }
}
