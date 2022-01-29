// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rae_curvedbottombutton_package/rae_curvedbottombutton_package.dart';
import './widgets/center_icon_button_widget.dart';
import './widgets/icon_button_widget.dart';
import './widgets/curved_painter.dart';
import 'package:rae_asset_package/rae_asset_package.dart';
import 'package:theme_management/theme_management.dart';

const _bottomContainerHeight = 90.0;

enum RAECurvedButtonSelected {
  leftButton,
  rightButton,
  centerButton,
}

class RAECurvedBottomButton extends StatelessWidget {
  final Widget leftButton;
  final String leftButtonTitle;
  final Widget rightButton;
  final String rightButtonTitle;
  final String centerButtonTitle;
  final ThemeColors? bgColorForBottomBar;
  final ThemeColors? bgColorForBottomBarIcon;
  final ThemeColors? shadowColorBottomBar;
  final ThemeColors? textColorForCenterWidget;

  RAECurvedButtonSelected? initialItem;

  RAECurvedBottomButton({
    Key? key,
    required this.leftButton,
    required this.leftButtonTitle,
    required this.rightButton,
    required this.rightButtonTitle,
    required this.centerButtonTitle,
    this.initialItem,
    ThemeColors? bgColorForBottomBar,
    ThemeColors? bgColorForBottomBarIcon,
    ThemeColors? shadowColorBottomBar,
    ThemeColors? textColorForCenterWidget,
  })  : bgColorForBottomBar = bgColorForBottomBar ??
            RAEAsset.colorsCurvedBottomBarBackground,
        bgColorForBottomBarIcon = bgColorForBottomBarIcon ??
            RAEAsset.colorsCurvedBottomBarIconBackground,
        shadowColorBottomBar = shadowColorBottomBar ??
            RAEAsset.colorsCurvedBottomBarShadow,
        textColorForCenterWidget = textColorForCenterWidget ??
            RAEAsset.colorsCurvedBottomBarCenterWidget,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = Modular.get<RAECurvedButtonCubit>();
    return BlocBuilder<RAECurvedButtonCubit, RAECurvedButtonState>(
      bloc: cubit,
      builder: (_, state) {
        if (state is RAECurvedButtonInitial) {
          cubit.onButtonTapped(RAECurvedButtonSelected.leftButton);
        } else if (state is RAECurvedButtonTapped) {
          if (state.selectedButton == RAECurvedButtonSelected.leftButton) {
            initialItem = RAECurvedButtonSelected.leftButton;
          } else if (state.selectedButton ==
              RAECurvedButtonSelected.rightButton) {
            initialItem = RAECurvedButtonSelected.rightButton;
          }
          else if (state.selectedButton ==
              RAECurvedButtonSelected.centerButton) {
            initialItem = RAECurvedButtonSelected.centerButton;
          }
        }
        return Container(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: size.width,
                  height: _bottomContainerHeight,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomPaint(
                        size: Size(size.width, _bottomContainerHeight),
                        painter: CurvedPainter(
                            fillColor: bgColorForBottomBar!.of(context),
                            shadowColor: shadowColorBottomBar!.of(context)),
                      ),
                      Center(
                          heightFactor: 0.3,
                          child: FractionallySizedBox(
                              widthFactor: 0.45,
                              heightFactor: 0.6,
                              child: CenterIconWidget(
                                buttonTitle: centerButtonTitle,
                                onPressed: () {
                                  cubit.onButtonTapped(
                                      RAECurvedButtonSelected.centerButton);
                                },
                              ))),
                      Container(
                        // width: size.width,
                        height: _bottomContainerHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: size.width * 0.25,
                              child: CustomIconButton(
                                  icon:
                                      leftButton, //Widget we can change image also
                                  buttonTitle: leftButtonTitle,
                                  onPressed: () {
                                    cubit.onButtonTapped(
                                        RAECurvedButtonSelected.leftButton);
                                  },
                                  bgColor: bgColorForBottomBarIcon!),
                            ),
                            Container(
                              width: size.width * 0.45,
                            ),
                            Container(
                              width: size.width * 0.25,
                              child: CustomIconButton(
                                  icon: rightButton,
                                  buttonTitle: rightButtonTitle,
                                  onPressed: () {
                                    cubit.onButtonTapped(
                                        RAECurvedButtonSelected.rightButton);
                                  },
                                  bgColor: bgColorForBottomBarIcon!),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
