import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class PreviewAppBar extends StatelessWidget {
  const PreviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        color: ColorUtils.background,
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 6.w,
                    color: ColorUtils.golden,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Constants.usernameText,
                          style: GoogleFonts.lexend(
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.8.w,
                            vertical: 0.4.h,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            Constants.s1Text,
                            style: GoogleFonts.lexend(
                              fontStyle: FontStyle.normal,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: ColorUtils.greenish,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Constants.pointsText,
                          style: GoogleFonts.lexend(
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: ColorUtils.secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          Constants.positionText,
                          style: GoogleFonts.lexend(
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp,
                              color: ColorUtils.golden,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        Constants.indVsAusText,
                        style: GoogleFonts.lexend(
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: ColorUtils.secondaryColor,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
