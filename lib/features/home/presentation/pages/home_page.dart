import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/features/home/presentation/bloc/index.dart';
import 'package:scoreboard_app/features/home/presentation/pages/index.dart';
import 'package:scoreboard_app/features/home/presentation/widgets/index.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  static const routeName = RoutesConstant.homePageRoute;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> with BasicPage {
  @override
  Widget setupPage() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BlocProvider(
          create: (context) => HomeBloc(),
          child: const SafeArea(
            child: HomeScreen(),
          )),
    );
  }

  @override
  Color? backgroundColor() => ColorUtils.background2;
  @override
  PreferredSizeWidget customAppBar(BuildContext context) => PreferredSize(
        preferredSize: Size.fromHeight(16.h),
        child: const ScoreboardAppBar(
          appBarText: 'Scoreboard 1',
        ),
      );
}
