import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';

abstract class HomeViewModel extends ViewModel {
  HomeViewModel({
    required super.navigatorController,
    required super.dialogController,
  });

  void goSetting();
}

class HomeViewModelImpl extends HomeViewModel {
  HomeViewModelImpl({
    required super.navigatorController,
    required super.dialogController,
  });

  @override
  void goSetting() {
    navigatorController.goSetting();
  }
}
