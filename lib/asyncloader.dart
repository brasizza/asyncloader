library asyncloader;

import 'package:flutter/material.dart';

import 'class/async_class.dart';

export 'class/async_class.dart';
export 'package:asyncloader/mixin/async_loader.dart';

extension AsyncLoader<T> on Future<T> {
  static Widget defaultDialog = const Center(child: CircularProgressIndicator());
  static void setDefaultLoading(Widget loader) => defaultDialog = loader;
  static Widget customLoader = const Center(child: CircularProgressIndicator());
  static BuildContext? context;
  static void setContext(BuildContext pageContext) => context = pageContext;
  Future<T> asyncLoader({Widget? customLoader}) async {
    try {
      return await AsyncLoaderClass(defaultDialog: defaultDialog).callAsyncLoader(this, customLoader: customLoader);
    } catch (e) {
      rethrow;
    }
  }
}
