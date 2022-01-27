import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rae_curvedbottombutton_package/rae_curvedbottombutton_package.dart';
import 'curved_painter.dart';
// import 'package:rae_asset_package/rae_asset_package.dart';
// import 'package:rae_localization_package/localization/dictionary_enum.dart';
import 'package:theme_management/theme_management.dart';

const _bottomBgButtonColorSelected =
    ThemeColors(dark: Colors.deepOrange, light: Colors.orange);
const _bottomBgButtonColorsUnselected =
    ThemeColors(dark: Colors.grey, light: Colors.grey);
const _bottonContainerHeight = 80.0;
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
                  height: _bottonContainerHeight,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomPaint(
                        size: Size(size.width, _bottonContainerHeight),
                        painter: CurvedPainter(),
                      ),
                      Center(
                        heightFactor: 0.1,
                        child: FloatingActionButton.extended(
                            onPressed: null, label: Text('I am experienced')),
                      ),
                      Container(
                        width: size.width,
                        height: _bottonContainerHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chat_bubble_outline,
                                color: (initialItem ==
                                        RAECurvedButtonSelected.chat)
                                    ? _bottomBgButtonColorSelected.of(context)
                                    : _bottomBgButtonColorsUnselected
                                        .of(context),
                              ),
                              onPressed: () {
                                cubit.onButtonTapped(
                                    RAECurvedButtonSelected.chat);
                              },
                              splashColor: Colors.white,
                            ),
                            Container(
                              width: size.width * 0.50,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.inbox_outlined,
                                  color: (initialItem ==
                                          RAECurvedButtonSelected.inbox)
                                      ? _bottomBgButtonColorSelected.of(context)
                                      : _bottomBgButtonColorsUnselected
                                          .of(context),
                                ),
                                onPressed: () {
                                  cubit.onButtonTapped(
                                      RAECurvedButtonSelected.inbox);
                                }),
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
