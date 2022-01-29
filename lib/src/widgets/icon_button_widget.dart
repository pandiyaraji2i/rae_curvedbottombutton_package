import 'package:flutter/material.dart';
import 'package:theme_management/theme_management.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rae_asset_package/rae_asset_package.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final String buttonTitle;
  final VoidCallback onPressed;
  final ThemeColors? bgColor;

  CustomIconButton({
    Key? key,
    required this.icon,
    required this.buttonTitle,
    required this.onPressed,
    ThemeColors? bgColor,
  })  : bgColor = bgColor ?? RAEAsset.colorsCurvedBottomBarIconBackground,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: bgColor!.of(context));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: IconButton(
            icon: icon,
            color: bgColor!.of(context),
            onPressed: onPressed,
          ),
        ),
        AutoSizeText(
          buttonTitle,
          style: textStyle,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
