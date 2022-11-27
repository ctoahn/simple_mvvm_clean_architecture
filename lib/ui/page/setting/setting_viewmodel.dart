import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';

abstract class SettingViewModel extends ViewModel {
  SettingViewModel({
    required super.navigatorController,
    required super.dialogController,
  });

  String get version;
}

class SettingViewModelImpl extends SettingViewModel {
  SettingViewModelImpl({
    required super.navigatorController,
    required super.dialogController,
  });

  @override
  String get version => '1.0.0';
}
