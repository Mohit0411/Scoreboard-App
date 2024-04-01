import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/features/home/index.dart';
import 'package:scoreboard_app/features/home/presentation/widgets/index.dart';
import 'package:scoreboard_app/shared/data/index.dart';
import 'package:scoreboard_app/shared/helper/index.dart';
import 'package:sizer/sizer.dart';
import 'package:super_tooltip/super_tooltip.dart';

class RunsTab extends StatelessWidget {
  const RunsTab({required this.state, super.key});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: state.runsList
            .map(
              (options) => RunsCard(
                options: options,
                state: state,
              ),
            )
            .toList(),
      ),
    );
  }
}

class RunsCard extends StatefulWidget {
  const RunsCard({required this.options, required this.state, super.key});
  final ScoreboardOptions options;
  final HomeState state;
  @override
  State<StatefulWidget> createState() => _RunsCardState();
}

class _RunsCardState extends State<RunsCard> {
  late SuperTooltipController _controller;

  @override
  void initState() {
    _controller = SuperTooltipController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.options.title,
                style: GoogleFonts.lexend(
                  fontStyle: FontStyle.normal,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: ColorUtils.backgrundWhite,
                  ),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              if (widget.options.canShowToolTip)
                SuperTooltip(
                  showBarrier: true,
                  controller: _controller,
                  popupDirection: TooltipDirection.right,
                  backgroundColor: ColorUtils.tooltipColor,
                  arrowTipDistance: 15.0,
                  arrowBaseWidth: 20.0,
                  arrowLength: 2.w,
                  borderColor: ColorUtils.gradient1,
                  borderWidth: 0.5,
                  showCloseButton: ShowCloseButton.none,
                  touchThroughAreaShape: ClipAreaShape.rectangle,
                  touchThroughAreaCornerRadius: 30,
                  barrierColor: const Color.fromARGB(26, 47, 45, 47),
                  content: Text(
                    "You can only predict any ${widget.options.maxSelectionLimit}",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: ColorUtils.backgrundWhite,
                      ),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _controller.showTooltip();
                    },
                    child: Icon(
                      Icons.info_outline,
                      color: ColorUtils.golden,
                      size: 5.w,
                    ),
                  ),
                ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.options.optionsData.entries
                .map(
                  (data) => OptionsCard(
                    isSelected: data.value.isSelected,
                    canShowToolTip: widget.options.canShowToolTip,
                    option: data.value.value,
                    title: data.key,
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 1.h,
          ),
          const Divider(
            height: 1,
            color: ColorUtils.gradient1,
          )
        ],
      ),
    );
  }
}
