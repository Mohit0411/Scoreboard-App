import 'dart:developer' as developer;
import 'package:flutter/widgets.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

abstract class RouteAwareWidgetState<T extends StatefulWidget> extends State<T>
    with RouteAware, WidgetsBindingObserver {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of<dynamic>(context)!);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      onResume();
    } else if (state == AppLifecycleState.paused) {
      onPause();
    }
  }

  @mustCallSuper
  void onResume() {
    developer.log('onResume', name: '$runtimeType');
  }

  @mustCallSuper
  void onPause() {
    developer.log('onPause', name: '$runtimeType');
  }

  @mustCallSuper
  @override
  // Called when the current route has been pushed.
  void didPush() {
    developer.log('didPush', name: '$runtimeType');
  }

  @mustCallSuper
  @override
  // Called when the top route has been popped off, and
  // the current route shows up.
  void didPopNext() {
    developer.log('didPopNext', name: '$runtimeType');
  }
}
