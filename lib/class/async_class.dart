import 'package:asyncloader/asyncloader.dart';
import 'package:flutter/material.dart';

class AsyncLoaderClass<T> {
  bool _isOpen = false;
  Widget? defaultDialog;
  AsyncLoaderClass({
    this.defaultDialog,
  });

  Future<T> callAsyncLoader(Future<T> futureFunction, {Widget? customLoader}) async {
    try {
      if (!_isOpen) {
        await _callDialog(customLoader);
      }

      return await futureFunction.whenComplete(() {
        _isOpen = false;
        Navigator.pop(AsyncLoader.context!);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future _callDialog(Widget? customLoader) async {
    _isOpen = true;

    showDialog(
        barrierDismissible: false,
        context: AsyncLoader.context!,
        builder: (_) => AlertDialog(
              content: customLoader ?? defaultDialog,
            ));
  }
}
