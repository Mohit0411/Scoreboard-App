import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(const ScoreboardApp());
}

class ScoreboardApp extends StatelessWidget {
  const ScoreboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        themeMode: ThemeMode.light,
        navigatorKey: navigationKey,
        title: 'Scoreboard App',
        navigatorObservers: [
          NavigatorObserver(),
        ],
        initialRoute: RoutesConstant.homePageRoute,
        theme: ThemeData(
          dialogBackgroundColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorUtils.azul,
          ),
          textTheme: TextTheme(
              displayLarge: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                height: 1,
                textStyle: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              displayMedium: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.sp,
                ),
              ),
              displaySmall: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              headlineMedium: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              headlineSmall: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              titleLarge: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              titleMedium: GoogleFonts.poppins(
                height: 1,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              titleSmall: GoogleFonts.poppins(
                height: 1,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              bodyLarge: GoogleFonts.poppins(
                height: 1,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
              bodyMedium: GoogleFonts.poppins(
                height: 1,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              labelLarge: GoogleFonts.poppins(
                height: 1,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              bodySmall: GoogleFonts.poppins(
                height: 1,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              labelSmall: GoogleFonts.poppins(
                height: 1,
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              )),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: ColorUtils.primary)
              .copyWith(secondary: ColorUtils.secondaryColor)
              .copyWith(background: ColorUtils.background),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.onGenerateRoute,
      );
    });
  }
}
