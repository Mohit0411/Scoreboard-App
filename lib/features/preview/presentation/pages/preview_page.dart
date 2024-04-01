import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/features/preview/presentation/bloc/index.dart';
import 'package:scoreboard_app/features/preview/presentation/pages/index.dart';
import 'package:scoreboard_app/features/preview/presentation/widgets/preview_app_bar.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'package:sizer/sizer.dart';

class PreviewPage extends BasePage {
  const PreviewPage({super.key});

  static const routeName = RoutesConstant.previewPageRoute;

  @override
  State<StatefulWidget> createState() => _PreviewPageState();
}

class _PreviewPageState extends BasePageState<PreviewPage> with BasicPage {
  @override
  Widget setupPage() {
    return BlocProvider(
        create: (context) => PreviewBloc(),
        child: const SafeArea(
          child: PreviewScreen(),
        ));
  }

  @override
  PreferredSizeWidget customAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(10.h),
      child: const PreviewAppBar(),
    );
  }
}
