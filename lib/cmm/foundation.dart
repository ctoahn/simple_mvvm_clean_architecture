import 'package:flutter/widgets.dart';
import 'package:simple_mvvm_clean_architecture/ui/controller/dialog_controller.dart';
import 'package:simple_mvvm_clean_architecture/ui/controller/navigator_controller.dart';

// ====== UI Layer =====

/// 사용자가 인식할수 있는 모바일의 화면 하나를 정의한다.
///
/// Page는 View와 ViewModel을 생성하고 관계를 설정하는 역할만을 담당한다.
abstract class BasePage extends StatelessWidget {
  const BasePage({super.key});
}

/// [Page]에서 실제 화면을 표시하는 단위로
///
/// [ViewModel]의 상태에 따라 화면을 다르게 구성한다.
/// 오직 화면을 build하는 것과 관련된 기능만을 제공하며, 연산식이나 로직은 포함하지 않는다.
abstract class View extends StatelessWidget {
  const View({super.key});
}

/// 기본적으로 [View]에 필요한 데이터를 제공하고, View 상태를 관리하는 역할과, View에서 발생하는 이벤트를
/// 처리하기 위한 비지니스 로직을 호출할수 있는 곳이다.
///
/// View와 관련된 로직을 포함하지만 도메인 단위의 비지니스 로직은 포함하지 않는다.
abstract class ViewModel with ChangeNotifier {
  ViewModelStatusType get status => _status;
  ViewModelStatusType _status = ViewModelStatusType.initial;

  @protected
  final NavigatorController navigatorController;

  @protected
  final DialogController dialogController;

  ViewModel({
    required this.navigatorController,
    required this.dialogController,
  });

  // 비동기 처리와 오류처리를 위한 함수
  void launch(Future<dynamic> Function() body, {Function(Exception e)? onError}) async {
    _status = ViewModelStatusType.loading;
    notifyListeners();

    try {
      await body();
    } on Exception catch (e) {
      onError?.call(e);
    }

    _status = ViewModelStatusType.none;
    notifyListeners();
  }
}

enum ViewModelStatusType { initial, loading, none } // success, error

/// 특정 Widget을 control하기 위한 것으로
/// View가 아닌 ViewModel에 직접 Widget을 제어해야 하는 특수한 경우에만 사용된다.
///
/// [NavigatorController]와 [DialogController]가 Conroller에 속한다.
abstract class Controller {}

abstract class EventHandler {}

// ====== Domain Layer =====
abstract class UseCase<T, Params> {
  Future<Result<T>> execute(Params params);
}

/// UseCase를 처리 후 결과
abstract class Result<T> {}

class Success<T> extends Result<T> {
  final T? value;
  Success([this.value]);
}

class Failure extends Result {}

class EmptyParams {}

// ====== Data Layer =====
/// Domain Layer에서  Data Layer에 접근할수 있는 통로로
/// Data가 저장된 저장소의 개념을 가진다.
///
/// Service에서는 Data layer의 내부 구현과 상관없이 동일한 결과를 수신한다.
abstract class Repository {}

/// [RemoteDataSource], [LocalDataSource] 와 같이 Data가 저장된 곳에 접근해
/// 직접 데이타를 저장하거나 가져오는 곳이다.
abstract class DataSource {}

/// Domain Layer의 여러 UseCsae에서 공통으로 사용하는 일부 기능을 분리해서 제공한다.
/// 유사한 기능단위로 하나의 Component로 묶어서 기능을 제공하거나
/// 써드파티 라이브러리를 UseCase에서 직접의 존하지 않고 component를 통해서 사용할 수 있도록 adapter의 역할을 하기도한다.
abstract class Component {}
