import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';

abstract class DialogController implements Controller {
  Future<dynamic> showAlertDialog({
    String? title,
    required String message,
  });
  Future<dynamic> showConfirmDialog({
    String? title,
    required String message,
  });
}

class DialogControllerImpl implements DialogController {
  @override
  Future showAlertDialog({String? title, required String message}) {
    throw UnimplementedError();
  }

  @override
  Future showConfirmDialog({String? title, required String message}) {
    throw UnimplementedError();
  }
}
