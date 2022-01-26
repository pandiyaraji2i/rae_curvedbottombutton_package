import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';

import 'modular/app_module.dart';
import 'modular/theme_and_material_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Enable theme changes/monitoring by creating a 'hive' object to persist information
  await ThemeManagement.setup();

  /// Set BLoC observer for additional console messages

  BlocOverrides.runZoned(
    () => runApp(ModularApp(
      module: AppModule(),
      child: ThemeAndMaterialWidget(),
    )),
    blocObserver: SimpleBlocObserver(),
    // NOTE: For release blocObserver: null,
  );
}
