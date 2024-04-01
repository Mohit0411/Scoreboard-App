import 'package:flutter/widgets.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
  static late String routeName;
}

abstract class BasePageState<Page extends BasePage> extends State<Page> {}
