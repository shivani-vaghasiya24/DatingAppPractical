import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end_task_practical/module/home/cubit/icon_cubit/icon_selection_cubit.dart';
import 'package:front_end_task_practical/module/home/cubit/icon_cubit/mcq_selection_cubit.dart';
import 'package:front_end_task_practical/utils/app_assets.dart';
import 'package:front_end_task_practical/utils/app_colors.dart';
import 'package:front_end_task_practical/utils/app_constants.dart';
import 'package:front_end_task_practical/utils/app_strings.dart';
import 'package:front_end_task_practical/utils/app_styles.dart';
import 'package:front_end_task_practical/widgets/header_widget.dart';
import 'package:front_end_task_practical/widgets/svg_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.blackColor1,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.backgrounImage,
                      height: 470.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 58.h,
                        left: 5.w,
                        right: 5.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeaderWidget(),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            ShaderScreen(),
            Positioned(
              top: 400.h,
              left: 15,
              right: 15,
              child: Stack(children: [
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors
                            .blackColor2, // Outer circle color (padding color)
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(65, 4, 8, 4),
                        child: Text(
                          "Angelina, 28",
                          style: AppStyles.textStyle12.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryTextColor),
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors
                            .blackColor2, // Outer circle color (padding color)
                      ),
                      padding: EdgeInsets.all(5), // Padding around the avatar
                      child: CircleAvatar(
                          radius: 25, // Inner circle radius
                          backgroundImage: AssetImage(AppAssets.profile)),
                    ),
                    SizedBox(
                      height: 20,
                      // width: double.infinity,
                    )
                  ],
                ),
                Positioned(
                  top: 29,
                  left: 69,
                  right: 0,
                  child: Text(
                    AppStrings.whatIsYourFavTime,
                    style: AppStyles.textStyle12.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryTextColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 78, 0, 11),
                  child: Column(
                    children: [
                      Text(
                        AppStrings.mineIsDefinitelyThePeace,
                        style: AppStyles.textStyle12.copyWith(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryTextColor),
                      ),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 2),
                            itemCount: AppConstants.mcqSelectionList.length,
                            padding: EdgeInsets.only(top: 14),
                            // shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<McqSelectionCubit>()
                                      .selectIcon(index);
                                },
                                child: MCQWidget(
                                  text: AppConstants.mcqSelectionList[index],
                                  mcq: AppConstants.mcqList[index],
                                  isSelected: context
                                          .watch<McqSelectionCubit>()
                                          .state ==
                                      index,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Positioned(
              bottom: 7.h,
              left: 15,
              right: 15,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.pickYourOption,
                          style: AppStyles.textStyle12.copyWith(
                              color: AppColors.lightTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                      Text(AppStrings.seeWhohasASimilarMind,
                          style: AppStyles.textStyle12.copyWith(
                              color: AppColors.lightTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: SvgImage(
                          image: AppAssets.micButton,
                        ),
                      ),
                      SvgImage(
                        image: AppAssets.nextButton,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          height: 45.h,
          color: AppColors.blackColor1,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  context.read<IconSelectionCubit>().selectIcon(index);
                },
                child: BottomIcons(
                  image: getIconImage(index),
                  isSelected:
                      context.watch<IconSelectionCubit>().state == index,
                  index: index,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  String getIconImage(int index) {
    switch (index) {
      case 0:
        return AppAssets.pokerCards;
      case 1:
        return AppAssets.bonfire;
      case 2:
        return AppAssets.chat;
      case 3:
      default:
        return AppAssets.user;
    }
  }
}

class MCQWidget extends StatelessWidget {
  final String text;
  final String mcq;
  final bool isSelected;
  const MCQWidget({
    super.key,
    required this.text,
    required this.mcq,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13.5, horizontal: 10),
        decoration: BoxDecoration(
            color: AppColors.blackColor3,
            border: Border.all(
                width: 2,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.blackColor3),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected ? AppColors.primaryColor : Colors.transparent,
                  border: Border.all(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.textColor)),
              child: Text(
                mcq,
                style: AppStyles.textStyle12.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  text,
                  maxLines: 2,
                  style: AppStyles.textStyle12.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
              ),
            ),
          ],
        ));
  }
}

class ShaderScreen extends StatelessWidget {
  const ShaderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(15, 17, 21, 0.0),
                Color.fromRGBO(13, 14, 18, 0.28),
                Color.fromRGBO(11, 12, 15, 0.64),
                Color.fromRGBO(9, 11, 13, 0.8),
                Colors.black,
              ],
              stops: [0.4397, 0.486, 0.5252, 0.5514, 0.5694],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Radial Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.0, -0.6), // Adjust position
              radius: 1.0,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.045),
                Color.fromRGBO(0, 0, 0, 0.107193),
                Color.fromRGBO(0, 0, 0, 0.135),
                Color.fromRGBO(0, 0, 0, 0.195),
                Color.fromRGBO(0, 0, 0, 0.24),
              ],
              stops: [0.0, 0.6328, 0.7566, 0.8844, 1.0],
            ),
          ),
        ),
        // Linear Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.4),
                Color.fromRGBO(0, 0, 0, 0.123359),
                Color.fromRGBO(0, 0, 0, 0.0),
              ],
              stops: [0.0, 0.14, 0.234],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class BottomIcons extends StatelessWidget {
  final String image;
  final bool isSelected;
  final int index;
  const BottomIcons({
    super.key,
    required this.image,
    required this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgImage(
            image: image, color: isSelected ? AppColors.secondaryColor : null),
        if (index == 1 || index == 2)
          Positioned(
              top: -4,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(width: 1.4, color: AppColors.borderColor),
                    color: AppColors.thirdColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Text(index == 2 ? "10" : "  ",
                      style: AppStyles.textStyle12.copyWith(
                          color: AppColors.borderColor,
                          fontSize: 7,
                          fontWeight: FontWeight.w700)),
                ),
              ))
      ],
    );
  }
}
