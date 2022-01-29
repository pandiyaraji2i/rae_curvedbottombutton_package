import 'package:flutter/material.dart';
import 'package:theme_management/theme_management.dart';

const _borderRadius = 25.0;
const _borderWidth = 2.0;

class CenterIconWidget extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final ThemeColors? bgColors;
  final ThemeColors? borderColors;
  final ThemeColors? textColors;
  final double? borderWidth;
  final double? borderRadius;
  CenterIconWidget({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    this.borderWidth = _borderWidth,
    this.borderRadius = _borderRadius,
    ThemeColors? bgColors,
    ThemeColors? borderColors,
    ThemeColors? textColors,
  })  : bgColors =
            bgColors ?? ThemeColors(dark: Colors.orange, light: Colors.green),
        borderColors = borderColors ??
            ThemeColors(dark: Colors.white, light: Colors.white),
        textColors =
            textColors ?? ThemeColors(dark: Colors.white, light: Colors.black),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColors!.of(context));

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
            side: BorderSide(
                color: borderColors!.of(context), width: _borderWidth),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(bgColors!.of(context)),
      ),
      onPressed: onPressed,
      child: FittedBox(
        child: Text(
          buttonTitle,
          style: textStyle,
        ),
      ),
    );
  }
}
