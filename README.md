# rae_curvedbottombutton_package

Package to create a curved bottom view with Three button(2 edge buttons and 1 center button)

## Install

```text
dependencies:
  rae_curvedbottombutton_package:
    git:
      url: https://github.com/RAE-Health/rae_curvedbottombutton_package.git
```

## Import

```dart
import 'package:rae_curvedbottombutton_package/rae_curvedbottombutton_package.dart';
```

## Language errors because Dart Analyzer crashed on VSCode

If errors like ```Traget URI doesn't...``` or ```Undefined name 'AppLocalizations'``` Reload the Dart Analyzer

1) Open the Command Palette (Ctrl+Shift+P)
2) Enter and select ```Developer: Reload Window```

## Usage

To use the package, add below code in your main.dart or wherever you need bottom bar. You can pass background and bar button colors (Optional params) based on your theme preference

```dart
RAECurvedBottomButton(
              leftButton: Icon(Icons.chat_bubble_outline), //Left button icon or image
              leftButtonTitle: RAELocalization.chat.text,  //Left button title
              rightButton: Icon(Icons.inbox_outlined), //Right button icon or image
              rightButtonTitle: RAELocalization.inbox.text, //Right button title
              centerButtonTitle: RAELocalization.iamexperiencing.text, //Center button 
              )
```

## Final Note

Be kind to each other
