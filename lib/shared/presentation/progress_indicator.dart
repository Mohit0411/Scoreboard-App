import 'package:flutter/material.dart';
import 'package:scoreboard_app/shared/index.dart';

class CustomProgressIndicator extends StatelessWidget {
  static Widget builder(BuildContext ctx) =>
      const Dialog(child: CustomProgressIndicator());

  final double? radius;
  final Color? color;

  const CustomProgressIndicator({
    super.key,
    this.color,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator.adaptive(
          key: key,
          backgroundColor: ColorUtils.greyish,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? ColorUtils.azul,
          ),
        ),
      ),
    );
  }
}
