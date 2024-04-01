import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/features/home/presentation/bloc/index.dart';
import 'package:scoreboard_app/features/home/presentation/widgets/index.dart';
import 'package:scoreboard_app/features/preview/presentation/pages/preview_page.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen>
    with BasicScreen<HomeScreen, HomeBloc, HomeState, HomeEvent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget builder(BuildContext context, HomeState state) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 7.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            color: ColorUtils.primary,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constants.selectionText,
                        style: GoogleFonts.lexend(
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: ColorUtils.grey,
                          ),
                        ),
                      ),
                      RichText(
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: state.getSelectionCount().toString(),
                          style: GoogleFonts.lexend(
                            fontStyle: FontStyle.normal,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            TextSpan(
                              text: '/12',
                              style: GoogleFonts.lexend(
                                fontStyle: FontStyle.normal,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: ColorUtils.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 3.5.h,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (ctx, index) {
                        return SizedBox(
                          width: 0.8.w,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Transform.rotate(
                          angle: 0.05,
                          child: Container(
                            color: state.getSelectionCount() >= (index + 1)
                                ? ColorUtils.gradient1
                                : ColorUtils.grey,
                            width: 4.4.w,
                          ),
                        );
                      },
                      itemCount: Constants.maxAttributeLength,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      pushEvent(ClearAtrributesEvent());
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 6.w,
                      color: ColorUtils.golden,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    onTap: (value) {
                      pushEvent(TabChangeEvent(value: value));
                    },
                    dividerColor: ColorUtils.background,
                    indicatorColor: ColorUtils.golden,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: GoogleFonts.lexend(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: ColorUtils.golden,
                      ),
                    ),
                    unselectedLabelStyle: GoogleFonts.lexend(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: ColorUtils.grey,
                      ),
                    ),
                    tabs: const [
                      Tab(
                        text: Constants.runText,
                      ),
                      Tab(text: Constants.wicketsText),
                      Tab(text: Constants.extrasText),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        RunsTab(state: state),
                        WicketsTab(state: state),
                        ExtrasTab(state: state),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 6.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomRaisedButton(
                                padding: EdgeInsets.symmetric(vertical: 1.8.h),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    PreviewPage.routeName,
                                  );
                                },
                                title: 'Preview',
                                backgroundColor: ColorUtils.background2,
                                style: GoogleFonts.lexend(
                                  fontStyle: FontStyle.normal,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: ColorUtils.golden,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                      color: ColorUtils.golden,
                                      width: 1,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: CustomRaisedButton(
                                padding: EdgeInsets.symmetric(vertical: 1.8.h),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    PreviewPage.routeName,
                                  );
                                },
                                title: 'Next',
                                backgroundColor: ColorUtils.golden,
                                style: GoogleFonts.lexend(
                                  fontStyle: FontStyle.normal,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: ColorUtils.background,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                      color: ColorUtils.golden,
                                      width: 1,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void listener(BuildContext context, HomeState state) {}
}
