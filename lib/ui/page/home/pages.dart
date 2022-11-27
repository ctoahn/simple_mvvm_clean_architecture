import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';
import 'package:simple_mvvm_clean_architecture/ui/controller/dialog_controller.dart';
import 'package:simple_mvvm_clean_architecture/ui/controller/navigator_controller.dart';
import 'package:simple_mvvm_clean_architecture/ui/page/home/home_view.dart';
import 'package:simple_mvvm_clean_architecture/ui/page/home/home_viewmodel.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) {
        final navigatorController = NavigatorControllerImpl();
        final dialogController = DialogControllerImpl();
        return HomeViewModelImpl(
          navigatorController: navigatorController,
          dialogController: dialogController,
        );
      },
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<HomeViewModel>(context);
          return HomeView(viewModel: viewModel);
        },
      ),
    );
  }
}
