import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';

/// Navigator를 제어하는 역할을 담당한다.
/// 모든 화면의 이동인 NavigatorController을 통해서 이루어 진다.
/// NavigatorController은 [ViewModel],[EventHandler]에서만 사용된다.
abstract class NavigatorController implements Controller {
  Future<void> goSetting();
}

class NavigatorControllerImpl implements NavigatorController {
  @override
  Future<void> goSetting() {
    throw UnimplementedError();
  }
}
