import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end_task_practical/module/home/cubit/icon_cubit/icon_selection_cubit.dart';
import 'package:front_end_task_practical/module/home/view/home_page.dart';
import 'package:front_end_task_practical/utils/app_colors.dart';
import 'package:front_end_task_practical/utils/app_constants.dart';
import 'package:front_end_task_practical/utils/app_strings.dart';

void main() {
  runApp(
      BlocProvider(create: (_) => IconSelectionCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(AppConstants.designWidth, AppConstants.designHeight),
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
            fontFamily: "Proxima Nova",
            useMaterial3: false,
            primaryColor: AppColors.primaryColor),
        home: const HomePage(),
      ),
    );
  }
}
