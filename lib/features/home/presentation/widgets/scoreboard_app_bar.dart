import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class ScoreboardAppBar extends StatelessWidget {
  const ScoreboardAppBar({required this.appBarText, super.key});

  final String appBarText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        color: ColorUtils.primary,
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 6.w,
                      color: ColorUtils.golden,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      appBarText,
                      style: GoogleFonts.lexend(
                        fontStyle: FontStyle.normal,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.help_outline,
                      size: 6.w,
                      color: ColorUtils.golden,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 5.w,
                      backgroundImage: const NetworkImage(
                        Constants.australiaFlagPath,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Constants.ausText,
                          style: GoogleFonts.lexend(
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: ColorUtils.grey,
                            ),
                          ),
                        ),
                        Text(
                          '0',
                          style: GoogleFonts.lexend(
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  Constants.appBarTitle,
                  style: GoogleFonts.lexend(
                    fontStyle: FontStyle.normal,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: ColorUtils.golden,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              Constants.indiaText,
                              style: GoogleFonts.lexend(
                                fontStyle: FontStyle.normal,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: ColorUtils.grey,
                                ),
                              ),
                            ),
                            Text(
                              '0',
                              style: GoogleFonts.lexend(
                                fontStyle: FontStyle.normal,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        CircleAvatar(
                          radius: 5.w,
                          backgroundImage: const NetworkImage(
                            Constants.indiaFlagPath,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
