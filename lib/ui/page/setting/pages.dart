import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';
import 'package:simple_mvvm_clean_architecture/ui/controller/dialog_controller.dart';
import 'package:simple_mvvm_clean_architecture/ui/controller/navigator_controller.dart';
import 'package:simple_mvvm_clean_architecture/ui/page/setting/setting_view.dart';
import 'package:simple_mvvm_clean_architecture/ui/page/setting/setting_viewmodel.dart';

class SettingPage extends BasePage {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingViewModel>(
      create: (BuildContext context) {
        final navigatorController = NavigatorControllerImpl();
        final dialogController = DialogControllerImpl();
        return SettingViewModelImpl(
          navigatorController: navigatorController,
          dialogController: dialogController,
        );
      },
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<SettingViewModel>(context);
          return SettingView(viewModel: viewModel);
        },
      ),
    );
  }
}
