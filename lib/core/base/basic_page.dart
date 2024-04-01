import 'package:flutter/material.dart';
import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/shared/index.dart';

mixin BasicPage<Page extends BasePage> on State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
      ),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      extendBodyBehindAppBar: true,
      body: Container(
        color: ColorUtils.primary,
        child: SafeArea(
          bottom: false,
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: backgroundColor(),
                  child: setupPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setupPage();

  PreferredSizeWidget customAppBar(BuildContext context);

  Color? backgroundColor() => ColorUtils.background;

  bool resizeToAvoidBottomInset() => false;
}
