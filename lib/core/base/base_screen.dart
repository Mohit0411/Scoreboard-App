import 'package:flutter/widgets.dart';
import 'package:scoreboard_app/core/index.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

abstract class BaseScreenState<Screen extends BaseScreen>
    extends RouteAwareWidgetState<BaseScreen> {
  Screen screen() => widget as Screen;
}
