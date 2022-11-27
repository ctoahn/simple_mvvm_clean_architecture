import 'package:flutter/material.dart';
import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';
import 'package:simple_mvvm_clean_architecture/ui/page/home/home_viewmodel.dart';

class HomeView extends View {
  final HomeViewModel viewModel;

  const HomeView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: TextButton.icon(
          onPressed: () => viewModel.goSetting(),
          icon: const Icon(Icons.settings),
          label: const Text('설정화면'),
        ),
      ),
    );
  }
}
