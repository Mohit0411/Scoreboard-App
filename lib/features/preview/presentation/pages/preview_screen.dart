import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/features/preview/data/index.dart';
import 'package:scoreboard_app/features/preview/presentation/bloc/index.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class PreviewScreen extends BaseScreen {
  const PreviewScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends BaseScreenState<PreviewScreen>
    with BasicScreen<PreviewScreen, PreviewBloc, PreviewState, PreviewEvent> {
  @override
  void initState() {
    pushEvent(FetchPreviewDataEvent());
    super.initState();
  }

  @override
  Widget builder(BuildContext context, PreviewState state) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: ColorUtils.gradient1,
            )),
        margin: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 3.h,
        ),
        child: Column(
          children: [
            const ScoreboardHeader(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ScoreboardCard(
                    index: index + 1,
                    options: state.previewList[index],
                  );
                },
                itemCount: state.previewList.length,
              ),
            ),
          ],
        ));
  }

  @override
  void listener(BuildContext context, PreviewState state) {}
}

class ScoreboardHeader extends StatelessWidget {
  const ScoreboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.5.h,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorUtils.gradient1,
            ColorUtils.gradient1,
          ],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        color: ColorUtils.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox.shrink(),
          const SizedBox.shrink(),
          Text(
            Constants.predictionScoreText,
            style: GoogleFonts.lexend(
              fontStyle: FontStyle.normal,
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: ColorUtils.whitish,
              ),
            ),
          ),
          Text(
            Constants.point,
            style: GoogleFonts.lexend(
              fontStyle: FontStyle.normal,
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: ColorUtils.whitish,
              ),
            ),
          ),
          Text(
            Constants.rank,
            style: GoogleFonts.lexend(
              fontStyle: FontStyle.normal,
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: ColorUtils.whitish,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreboardCard extends StatelessWidget {
  const ScoreboardCard({required this.index, required this.options, super.key});
  final int index;
  final PreviewOptions options;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$index.',
            style: GoogleFonts.lexend(
              fontStyle: FontStyle.normal,
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: ColorUtils.grey,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              options.title,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lexend(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: ColorUtils.whitish,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 0.8.h,
              ),
              decoration: BoxDecoration(
                color: ColorUtils.gradient2.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${options.value}/',
                    style: GoogleFonts.lexend(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorUtils.secondaryColor,
                      ),
                    ),
                  ),
                  Text(
                    '0',
                    style: GoogleFonts.lexend(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorUtils.golden,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 0.8.h,
              ),
              decoration: BoxDecoration(
                color: ColorUtils.gradient2.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Text(
                '0',
                style: GoogleFonts.lexend(
                  fontStyle: FontStyle.normal,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorUtils.golden,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 0.w,
                vertical: 0.8.h,
              ),
              decoration: BoxDecoration(
                color: ColorUtils.gradient2.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Text(
                '0',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontStyle: FontStyle.normal,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorUtils.golden,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
