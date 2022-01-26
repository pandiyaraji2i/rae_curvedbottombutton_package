import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:rae_asset_package/rae_asset_package.dart';
// import 'package:rae_localization_package/localization/dictionary_enum.dart';
// import 'package:theme_management/theme_management.dart';

class RAECurvedBottomButton extends StatelessWidget {
  final Widget leftButton;
  final Widget rightButton;
  final Widget centerButton;

  const RAECurvedBottomButton({
    Key? key,
    required this.leftButton,
    required this.rightButton,
    required this.centerButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Empty'),
      ),
    );
  }
}
