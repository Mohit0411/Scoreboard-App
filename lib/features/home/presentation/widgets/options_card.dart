import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/features/home/index.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class OptionsCard extends StatefulWidget {
  const OptionsCard(
      {required this.title,
      required this.option,
      required this.canShowToolTip,
      required this.isSelected,
      super.key});
  final String title;
  final int option;
  final bool isSelected;
  final bool canShowToolTip;

  @override
  State<StatefulWidget> createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(
        text: widget.option != 0 ? widget.option.toString() : '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.option == 0) {
      controller.clear();
    }
    return Card(
      elevation: widget.isSelected ? 3 : 0,
      color: widget.isSelected ? ColorUtils.background : ColorUtils.background2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0.0.h,
          horizontal: widget.isSelected ? 5.w : 0.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Text(
                widget.title,
                style: GoogleFonts.lexend(
                  fontStyle: FontStyle.normal,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorUtils.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: CustomEditText(
                controller: controller,
                onTap: () {
                  context.read<HomeBloc>().add(
                        AttributeSelectedEvent(
                          attributeName: widget.title,
                        ),
                      );
                },
                validator: (value) {
                  if ((value == null || value.isEmpty) && widget.isSelected) {
                    return 'Please enter value';
                  }
                  if (value == '0') {
                    return 'Please enter non-zero value';
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<HomeBloc>().add(
                        AttributeChangeEvent(
                          attributeName: widget.title,
                          value: int.tryParse(value) ?? 0,
                        ),
                      );
                },
                hintText: '-',
                labelText: '',
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: widget.canShowToolTip
                  ? widget.isSelected
                      ? GestureDetector(
                          onTap: () {
                            context.read<HomeBloc>().add(
                                  AttributeSelectedEvent(
                                      attributeName: widget.title,
                                      isSelected: false),
                                );
                          },
                          child: Icon(
                            Icons.remove_circle_outline,
                            size: 5.w,
                            color: ColorUtils.golden,
                          ),
                        )
                      : Icon(Icons.add_circle_outline,
                          size: 5.w, color: ColorUtils.golden)
                  : Icon(
                      Icons.check_circle_outline,
                      size: 5.w,
                      color: ColorUtils.golden,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
