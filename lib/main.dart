import 'package:appbar/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.primaryBlue,
        primaryColorLight: AppColors.textWhite,
        primaryColorDark: AppColors.textBlack,
        listTileTheme: ListTileThemeData(
          titleTextStyle: GoogleFonts.inter(
            fontSize: 20,
            color: AppColors.textWhite,
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: GoogleFonts.inter(
            fontSize: 15,
            color: AppColors.blueLight,
            fontWeight: FontWeight.w500,
          ),
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            fontSize: 40,
            color: AppColors.textWhite,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 30,
            color: AppColors.blueLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
        home: const HomeScreen());
  }
}
