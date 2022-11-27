import 'package:flutter/material.dart';
import 'package:simple_mvvm_clean_architecture/cmm/foundation.dart';
import 'package:simple_mvvm_clean_architecture/ui/page/setting/setting_viewmodel.dart';

class SettingView extends View {
  final SettingViewModel viewModel;

  const SettingView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting Page')),
      body: const Text('Empty Body'),
    );
  }
}
