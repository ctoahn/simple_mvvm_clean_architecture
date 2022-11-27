import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';

/// 앱에서 사용할 Theme을 수정한다.
class UpdateThemeUseCase extends UseCase<ThemeType, UpdateThemeParams> {
  @override
  Future<Result<ThemeType>> execute(UpdateThemeParams params) {
    throw UnimplementedError();
  }
}

class UpdateThemeParams {
  final ThemeType themeType;
  UpdateThemeParams({required this.themeType});
}

enum ThemeType { blue, geeen }
