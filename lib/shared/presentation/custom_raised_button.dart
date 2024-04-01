import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    this.padding,
    this.elevation,
    this.margin,
    this.style,
    this.height,
    this.shape,
  });

  final double? height;
  final double? elevation;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final String title;
  final Color backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 3,
          backgroundColor:
              onPressed == null ? ColorUtils.background : backgroundColor,
          padding: padding,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
                side: BorderSide.none,
              ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: style ??
              GoogleFonts.lexend(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 6.sp,
                  color: ColorUtils.golden,
                ),
              ),
        ),
      ),
    );
  }
}
