import '../asyncloader.dart';

mixin AsyncLoaderMixin<T> {
  final _myClass = AsyncLoaderClass(defaultDialog: AsyncLoader.defaultDialog);

  Future<T> callAsyncLoader(Future<T> futureFunction) async {
    return await _myClass.callAsyncLoader(futureFunction);
  }
}
