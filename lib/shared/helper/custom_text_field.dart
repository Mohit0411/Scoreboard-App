import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class CustomEditText extends StatefulWidget {
  const CustomEditText({
    super.key,
    this.suffixIcon,
    this.labelTextColor,
    required this.labelText,
    this.hintText = '',
    this.focusNode,
    this.obscureText = false,
    this.enabled = true,
    this.margin,
    this.style,
    this.inputTextStyle,
    this.extraInfoStyle,
    this.wrapTextStyle,
    this.wrapText = '',
    this.extraInfoText = '',
    this.infoIcon = false,
    this.errorText = '',
    this.hintStyle,
    this.inputFormatters,
    this.autoFillHints,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength = 4,
    this.maxLines,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.controller,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onIconTap,
    this.textFormKey,
  });

  final Key? textFormKey;
  final Widget? suffixIcon;
  final String wrapText;
  final TextStyle? wrapTextStyle;
  final TextStyle? style;
  final TextStyle? inputTextStyle;
  final String extraInfoText;
  final TextStyle? extraInfoStyle;
  final FocusNode? focusNode;
  final Color? labelTextColor;
  final String labelText;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final bool infoIcon;
  final VoidCallback? onIconTap;
  final EdgeInsets? margin;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;

  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autoFillHints;

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.2.h,
      ),
      child: TextFormField(
        cursorColor: ColorUtils.azul,
        key: widget.textFormKey,
        style: widget.inputTextStyle ??
            GoogleFonts.lexend(
              fontStyle: FontStyle.normal,
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorUtils.whitish,
              ),
            ),
        maxLength: widget.maxLength,
        maxLines: widget.maxLines ?? 1,
        onTap: widget.onTap,
        enableSuggestions: false,
        autocorrect: false,
        initialValue: widget.initialValue,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        controller: widget.controller,
        enabled: widget.enabled,
        focusNode: _focusNode,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        autofillHints: widget.autoFillHints,
        textCapitalization: widget.textCapitalization,
        decoration: InputDecoration(
          isDense: true,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          counterText: '',
          suffixIcon: widget.suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 5.w,
          ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              GoogleFonts.lexend(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 10.sp,
                  color: Colors.white,
                ),
              ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: widget.errorText != null
              ? widget.errorText != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorUtils.tomatoTwo,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    )
              : OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
          fillColor: ColorUtils.gradient3.withOpacity(0.65),
          filled: true,
          errorStyle: GoogleFonts.lexend(
            fontStyle: FontStyle.normal,
            textStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 6.sp,
              color: ColorUtils.tomatoTwo,
            ),
          ),
          errorText: widget.errorText,
          errorMaxLines: 1,
        ),
      ),
    );
  }
}
