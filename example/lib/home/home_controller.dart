import 'package:asyncloader/asyncloader.dart';
import 'package:example/components/my_loadig.dart';

class HomeController with AsyncLoaderMixin {
  Future<bool> loginSucesso() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      return true;
    }).asyncLoader(
        customLoader: const MyLoading(
      texto: 'Fazendo login!!!!',
    ));
  }

  Future<void> loginError() async {
    try {
      await _fakeError().asyncLoader();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _fakeError() async {
    await Future.delayed(const Duration(seconds: 3), () {
      throw ('Erro em seus dados.');
    });
  }

  Future<bool> isValidUser() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      return true;
    }).asyncLoader();
  }

  Future<bool> isValidUserAndLogin() async {
    return await (isValidUser().asyncLoader()).then((value) async {
      return await loginSucesso();
    });
  }

  Future<void> isValidUserAndLoginError() async {
    return await (isValidUser().asyncLoader()).then((value) async {
      await loginError().asyncLoader();
    });
  }

  Future goBack(Function callback) async {
    return await Future.delayed(const Duration(seconds: 3), () {
      callback();
    }).asyncLoader();
  }
}
