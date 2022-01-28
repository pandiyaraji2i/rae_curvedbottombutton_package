// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rae_curvedbottombutton_package/rae_curvedbottombutton_package.dart';
import 'curved_painter.dart';
import 'icon_button_widget.dart';
import 'package:rae_localization_package/rae_localization_package.dart';
// import 'package:rae_asset_package/rae_asset_package.dart';
import 'package:theme_management/theme_management.dart';

// const _bottomBgButtonColorSelected =
//     ThemeColors(dark: Colors.deepOrange, light: Colors.orange);
// const _bottomBgButtonColorsUnselected =
//     ThemeColors(dark: Colors.grey, light: Colors.grey);
const _bottomContainerHeight = 90.0;
const _bgColorForBottomBar =
    ThemeColors(dark: Colors.white, light: Colors.white);
const _bgColorForBottomBarIcon =
    ThemeColors(dark: Colors.orange, light: Colors.green);
const _shadowColorBottonBar =
    ThemeColors(dark: Colors.white, light: Colors.black);
const _textColorForCenterWidget =
    ThemeColors(dark: Colors.white, light: Colors.black);
const _borderColorForCenterWidget = ThemeColors(dark: Colors.white, light: Colors.white);
const _borderWidthForCenterWidget = 2.0;
const _borderRadiusForCenterButton = 25.0;
enum RAECurvedButtonSelected {
  chat,
  inbox,
  iamexperienced,
}

class RAECurvedBottomButton extends StatelessWidget {
  final Widget leftButton;
  final Widget rightButton;
  final Widget centerButton;
  RAECurvedButtonSelected? initialItem;

  RAECurvedBottomButton({
    Key? key,
    required this.leftButton,
    required this.rightButton,
    required this.centerButton,
    this.initialItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = Modular.get<RAECurvedButtonCubit>();
    final textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _textColorForCenterWidget.of(context));
    return BlocBuilder<RAECurvedButtonCubit, RAECurvedButtonState>(
      bloc: cubit,
      builder: (_, state) {
        if (state is RAECurvedButtonInitial) {
          cubit.onButtonTapped(RAECurvedButtonSelected.chat);
        } else if (state is RAECurvedButtonTapped) {
          if (state.selectedButton == RAECurvedButtonSelected.chat) {
            initialItem = RAECurvedButtonSelected.chat;
          } else if (state.selectedButton == RAECurvedButtonSelected.chat) {
            initialItem = RAECurvedButtonSelected.inbox;
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
                            fillColor: _bgColorForBottomBar.of(context),
                            shadowColor: _shadowColorBottonBar.of(context)),
                      ),
                      Center(
                          heightFactor: 0.3,
                          child: FractionallySizedBox(
                              widthFactor: 0.45,
                              heightFactor: 0.6,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          _borderRadiusForCenterButton),
                                      side: BorderSide(
                                          color: _borderColorForCenterWidget.of(context), width: _borderWidthForCenterWidget),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      _bgColorForBottomBarIcon.of(context)),
                                ),
                                onPressed: () {
                                  cubit.onButtonTapped(
                                      RAECurvedButtonSelected.iamexperienced);
                                },
                                child: FittedBox(
                                  child: Text(RAELocalization.iamexperiencing.text, style: textStyle,),
                                ) ,
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
                                icon: Icon(Icons.chat_bubble_outline), //Widget we can change image also
                                buttonTitle: RAELocalization.chat.text,
                                onPressed: () {
                                  cubit.onButtonTapped(RAECurvedButtonSelected.chat
                                  );
                                },
                                bgColor: _bgColorForBottomBarIcon),
                            )
                            ,
                            Container(
                              width: size.width * 0.45,
                            ),

                            Container(
                              width: size.width * 0.25,
                              child:
                            CustomIconButton(
                                icon: Icon(Icons.inbox_outlined),
                                buttonTitle: RAELocalization.inbox.text,
                                onPressed: () {
                                  cubit.onButtonTapped(RAECurvedButtonSelected.inbox
                                  );
                                },
                                bgColor: _bgColorForBottomBarIcon),),
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
