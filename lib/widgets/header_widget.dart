import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end_task_practical/utils/app_assets.dart';
import 'package:front_end_task_practical/utils/app_colors.dart';
import 'package:front_end_task_practical/utils/app_strings.dart';
import 'package:front_end_task_practical/utils/app_styles.dart';
import 'package:front_end_task_practical/widgets/svg_image.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.strollBonfire,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w700,
                color: AppColors.headerTextColor,
                // foreground: Paint()
                //   ..style = PaintingStyle.stroke
                //   ..strokeWidth = 0 / 32,
                // // ..color = AppColors.strokeColor, // Stroke color
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: AppColors.blackColor.withOpacity(0.2),
                    offset: Offset(0, 2), // Shadow position
                  ),
                ],
              ),
            ),
            SvgImage(image: AppAssets.dropDownArrow)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 3.27.w),
              child: SvgImage(image: AppAssets.clock),
            ),
            Text(
              "22h 00m",
              style: AppStyles.textStyle12,
              textAlign: TextAlign.end,
            ),
            SizedBox(
              width: 9.73.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 3.27.w),
              child: SvgImage(
                image: AppAssets.userWhite,
              ),
            ),
            Text(
              "103",
              style: AppStyles.textStyle12,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ],
    );
  }
}
