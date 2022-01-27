import 'package:asyncloader/class/async_class.dart';
import 'package:flutter/material.dart';

class SmartNavigatorObserver extends NavigatorObserver {
  //TODO essa classe observa os tipos de rotas (Push, pop etc) e atualiza o contexto do controller.

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncLoaderClass.setContext = navigator!.context;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    asyncLoaderClass.setContext = navigator!.context;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncLoaderClass.setContext = navigator!.context;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    asyncLoaderClass.setContext = navigator!.context;
  }
}
